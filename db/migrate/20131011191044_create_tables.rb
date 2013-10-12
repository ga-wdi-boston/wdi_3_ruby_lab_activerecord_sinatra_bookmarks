class CreateTables < ActiveRecord::Migration
  def up
    create_table :urls do |t|
      t.string :link
      t.string :shortened
    end
  end

  def down
    drop_table :urls do |t|
      t.string :link
      t.string :shortened
    end
  end
end
