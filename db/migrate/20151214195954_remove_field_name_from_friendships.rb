class RemoveFieldNameFromFriendships < ActiveRecord::Migration
  def change
    remove_column :friendships, :create, :string
    remove_column :friendships, :destroy, :string
  end
end
