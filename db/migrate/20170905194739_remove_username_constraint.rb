class RemoveUsernameConstraint < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :user_username
  end
end
