class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
    	t.string :name
    	t.string :date_created
    	t.belongs_to :user_id
      t.timestamps
    end
  end
end
