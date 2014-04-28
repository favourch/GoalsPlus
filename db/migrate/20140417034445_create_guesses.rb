class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :user
      t.references :match
      t.integer    :goals_a, :null => false
      t.integer    :goals_b, :null => false
      t.integer    :pens_a
      t.integer    :pens_b
      t.integer    :points

      t.timestamps
    end
    add_index :guesses, :user_id
    add_index :guesses, :match_id

    add_index :guesses, [:user_id, :match_id], :unique => true

  end
end
