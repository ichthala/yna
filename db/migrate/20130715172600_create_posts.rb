class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.text :text
      t.float :latitude
      t.float :longitude
      t.string :zipcode
      t.belongs_to :user
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
