class CreateStadia < ActiveRecord::Migration
  def change
    create_table :stadia do |t|
      t.string :name, :null => false
      t.references :city, :null => false
      t.integer :capacity, :null => false

      t.timestamps
    end
    add_index :stadia, :city_id

  end
end
