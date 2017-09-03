class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false, unique: true
      t.string :maker, null: false
      t.string :location, null: false
      t.string :year, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
