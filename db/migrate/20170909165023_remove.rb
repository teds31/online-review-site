class Remove < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :role, :string, null: false, default: "member"
  end
end
