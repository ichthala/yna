class CreateTags < ActiveRecord::Migration
  def up
    create_table :tags do |t|
      t.string :tag
      t.timestamps
    end
  end

  def down
    drop_table :tags
  end
end
