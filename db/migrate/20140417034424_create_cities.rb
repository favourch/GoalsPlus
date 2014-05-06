class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.references :timezone, null: false, default: 146
      t.references :country, null: false, default: 123

      t.timestamps
    end
    add_index :cities, :country_id
    add_index :cities, :timezone_id
  end
end
