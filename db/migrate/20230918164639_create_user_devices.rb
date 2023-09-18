class CreateUserDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :user_devices do |t|
      t.references :user, foreign_key: true, null: false
      t.string :device_token, null: false, index: { unique: true }
      t.string :auth_token, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
