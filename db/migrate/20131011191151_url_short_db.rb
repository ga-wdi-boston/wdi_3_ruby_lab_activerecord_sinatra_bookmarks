class UrlShortDb < ActiveRecord::Migration
  def up
    create_table :urls do |t|
      t.string :long_url
      t.string :new_url
      t.timestamps
    end
  end

  def down
    drop_table :urls
  end
end
