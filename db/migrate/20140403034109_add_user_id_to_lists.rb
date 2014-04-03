class AddUserIdToLists < ActiveRecord::Migration
  def change
  	add_column :items, :user_id
  end
end
