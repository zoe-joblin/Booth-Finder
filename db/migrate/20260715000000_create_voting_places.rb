class CreateVotingPlaces < ActiveRecord::Migration[8.1]
  def change
    create_table :voting_places do |t|
      t.string :source_id, null: false
      t.string :name, null: false
      t.string :address_line_1
      t.string :address_line_2
      t.references :suburb, null: false, foreign_key: true
      t.string :postcode
      t.string :city
      t.string :electorate
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.string :venue_type
      t.text :opening_hours
      t.boolean :accessible, default: false, null: false
      t.text :notes
      t.string :source_dataset
      t.datetime :source_last_updated
      t.datetime :imported_at

      t.timestamps
    end

    add_index :voting_places, :source_id, unique: true
    add_index :voting_places, :postcode
    add_index :voting_places, :city
    add_index :voting_places, :electorate
  end
end
