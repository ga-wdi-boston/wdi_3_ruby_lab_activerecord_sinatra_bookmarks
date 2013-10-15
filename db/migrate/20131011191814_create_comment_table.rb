class CreateCommentTable < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.integer :link_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def down
    drop_table :comments
  end
end
