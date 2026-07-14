class CreateSuburbs < ActiveRecord::Migration[8.1]
  def change
    create_table :suburbs do |t|
      t.string :name, null: false
      t.string :postcode
      t.string :city
      t.string :region
      t.timestamps
    end

    add_index :suburbs, [ :name, :city ], unique: true
    add_index :suburbs, :postcode
  end
end
