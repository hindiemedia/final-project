class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      	t.string :name
        t.integer :user_id
        t.integer :story_id
      t.timestamps
    end
  end
end
