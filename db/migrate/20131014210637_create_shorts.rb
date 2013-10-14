class CreateShorts < ActiveRecord::Migration
  def change
    create_table :shorts do |t|
      t.string :long

      t.timestamps
    end
  end
end
