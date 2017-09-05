class ChangeTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :product_reviews, :reviews 
  end
end
