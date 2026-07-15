require "test_helper"

class SuburbTest < ActiveSupport::TestCase
  test "is invalid without a name" do
    suburb = Suburb.new(city: "Wellington")

    assert_not suburb.valid?
    assert_includes suburb.errors[:name], "can't be blank"
  end

  test "is invalid without a city" do
    suburb = Suburb.new(name: "Kelburn")

    assert_not suburb.valid?
    assert_includes suburb.errors[:city], "can't be blank"
  end

  test "is invalid with a duplicate name in the same city" do
    Suburb.create!(name: "Karori", city: "Wellington")
    duplicate = Suburb.new(name: "Karori", city: "Wellington")

    assert_not duplicate.valid?
    assert_includes duplicate.errors[:name], "has already been taken"
  end

  test "is valid with the required attributes" do
    suburb = Suburb.new(name: "Karori", city: "Wellington")

    assert suburb.valid?
  end
end
