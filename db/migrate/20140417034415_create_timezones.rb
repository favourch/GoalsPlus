class CreateTimezones < ActiveRecord::Migration
  def change
    create_table :timezones do |t|
      t.string :name
      t.string :tzinfo
      t.string :utc

      t.timestamps
    end
  end
end
