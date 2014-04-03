class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
    	t.string :name
    	t.string :date_created
      t.timestamps
    end
  end
end
