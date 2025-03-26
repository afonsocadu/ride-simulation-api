class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :destinationLatitude
      t.integer :destinationLongitude
      t.integer :originLatitude
      t.integer :originLongitude
      t.boolean :completed
      t.integer :price

      t.timestamps
    end
  end
end
