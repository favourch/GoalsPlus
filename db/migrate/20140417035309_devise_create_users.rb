class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :user_name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.references :setting, null: false, default: 1

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer :sign_in_count, null: false, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      ## Confirmable
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps
    end

    create_table(:roles) do |t|
      t.string :name, :null => false
    end

    create_table(:languages) do |t|
      t.string :name, :null => false
      t.string :code, :null => false
    end


    create_table(:settings) do |t|
      t.string :screen_name, default: '', null: false
      t.string :cell_phone, default: nil
      t.references :role, default: 3, null: false
      t.references :timezone, default: 6
      t.references :team, default: 1
      t.string :beer, default: "Beer"
      t.references :language, default: 1
    end


    add_index :users, :setting_id
    add_index :settings, :timezone_id
    add_index :settings, :language_id
    add_index :settings, :team_id
    add_index :settings, :role_id
    add_index :languages, :name, :unique => true
    add_index :roles, :name, :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :email, :unique => true
    add_index :settings, :screen_name, :unique => true


    Language.create id: 1, name: 'russian', code: 'ru'
    Language.create id: 2, name: 'english', code: 'en'
    Language.create id: 3, name: 'ukrainian', code: 'ua'
    Role.create id: 1, name: 'admin'
    Role.create id: 2, name: 'user'
    Role.create id: 3, name: 'guest'
    Setting.create id: 1, screen_name: '', cell_phone: '', role_id: 3, timezone_id: 6, beer: 'Beer', language_id: 1


    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end
end
