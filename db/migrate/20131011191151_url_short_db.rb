class UrlShortDb < ActiveRecord::Migration
  def up
    create_table :urls do |t|
      t.string :long_url
      t.string :new_url
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def down
    drop_table :urls
  end
end
