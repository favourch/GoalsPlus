class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string  :name,           :null => false
      t.string  :short,          :null => false
      t.boolean :international,  :null => false, :default => true
      t.boolean :club,           :null => false, :default => true
      t.integer :rating

      t.timestamps
    end
    add_index :tournaments, :name,   :unique => true

  end
end
