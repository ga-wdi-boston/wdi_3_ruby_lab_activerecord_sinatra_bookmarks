class CreateLinks < ActiveRecord::Migration
  def up
    create_table :links do |t|
      t.string :long_url
      t.string :short_url
      t.timestamps
    end
  end

  def down
    drop_table :links
  end
end
