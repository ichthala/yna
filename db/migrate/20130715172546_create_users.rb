class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :email
      t.text :bio
      t.string :img
    end
  end

  def down
    drop_table :users
  end
end
