class VotingPlace < ApplicationRecord
  belongs_to :suburb

  validates :source_id, presence: true, uniqueness: true
  validates :name, presence: true

  scope :by_suburb, ->(suburb_name_or_record) {
    if suburb_name_or_record.present?
      if suburb_name_or_record.is_a?(Suburb)
        where(suburb: suburb_name_or_record)
      else
        joins(:suburb).where(suburbs: { name: suburb_name_or_record })
      end
    end
  }
  scope :by_postcode, ->(postcode) { where(postcode: postcode) if postcode.present? }
  scope :by_city, ->(city) { where(city: city) if city.present? }
  scope :by_electorate, ->(electorate) { where(electorate: electorate) if electorate.present? }
  scope :venue_type, ->(venue_type) { where(venue_type: venue_type) if venue_type.present? }

  def full_address
    [ address_line_1, address_line_2, suburb&.name, city, postcode ].compact.join(", ")
  end

  def source_info
    [ source_dataset, source_id ].compact.join("/")
  end
end
