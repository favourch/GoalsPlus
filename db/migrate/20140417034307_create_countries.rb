class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string     :name,       :null => false
      t.string     :code,       :null => false
      t.references :continent,  :null => false

      t.timestamps
    end
    add_index :countries, :name,  :unique => true
    add_index :countries, :code,  :unique => true

    add_index :countries, :continent_id

  end
end
