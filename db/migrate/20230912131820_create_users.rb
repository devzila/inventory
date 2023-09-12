class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :role
      t.string :name, null: false
      t.string :email, null: false, index: true
      t.string :password_digest
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.string :mobile_number
      t.boolean :active, default: true, index: true

      t.timestamps
    end
  end
end
