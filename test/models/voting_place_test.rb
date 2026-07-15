require "test_helper"

class VotingPlaceTest < ActiveSupport::TestCase
  def setup
    @suburb = suburbs(:one)
  end

  test "is invalid without a source_id" do
    voting_place = VotingPlace.new(name: "Election Centre", suburb: @suburb)

    assert_not voting_place.valid?
    assert_includes voting_place.errors[:source_id], "can't be blank"
  end

  test "is invalid without a name" do
    voting_place = VotingPlace.new(source_id: "venue-001", suburb: @suburb)

    assert_not voting_place.valid?
    assert_includes voting_place.errors[:name], "can't be blank"
  end

  test "is invalid with a duplicate source_id" do
    VotingPlace.create!(source_id: "venue-001", name: "Election Centre", suburb: @suburb)
    duplicate = VotingPlace.new(source_id: "venue-001", name: "Another Centre", suburb: @suburb)

    assert_not duplicate.valid?
    assert_includes duplicate.errors[:source_id], "has already been taken"
  end

  test "is valid with the required attributes" do
    voting_place = VotingPlace.new(source_id: "venue-002", name: "Community Hall", suburb: @suburb)

    assert voting_place.valid?
  end
end
