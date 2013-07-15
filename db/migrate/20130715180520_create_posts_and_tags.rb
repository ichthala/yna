class CreatePostsAndTags < ActiveRecord::Migration
  def up
    create_table :posts_tags do |t|
      t.belongs_to :post
      t.belongs_to :tag
    end
  end

  def down
    drop_table :posts_tags
  end
end
