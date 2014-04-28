class CreateContinents < ActiveRecord::Migration
  def change
    create_table :continents do |t|
      t.string :name, :null => false
      t.string :code, :null => false
      t.string :federation, :null => false

      t.timestamps
    end

    add_index :continents, :name, :unique => true
    add_index :continents, :code, :unique => true

  end
end
