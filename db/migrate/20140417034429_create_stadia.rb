class CreateStadia < ActiveRecord::Migration
  def change
    create_table :stadia do |t|
      t.string :name, null: false
      t.references :city, null: false, default: 1
      t.integer :capacity, null: false, default: 1000

      t.timestamps
    end
    add_index :stadia, :city_id

  end
end
