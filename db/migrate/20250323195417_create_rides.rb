class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.references :user, null: false, foreign_key: true
      t.string :destination
      t.string :origin
      t.boolean :completed
      t.integer :price

      t.timestamps
    end
  end
end
