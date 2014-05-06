class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :short, null: false
      t.references :stadium, null: false, default: 1
      t.boolean :national, null: false, default: false
      t.integer :rating, null: false, default: -1

      t.timestamps
    end
    add_index :teams, :stadium_id

  end
end
