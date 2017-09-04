class CreateProductReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :product_reviews do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :user_username, null: false
      t.integer :user_id, null: false
      t.integer :product_id, null: false

      t.timestamps
    end
  end
end
