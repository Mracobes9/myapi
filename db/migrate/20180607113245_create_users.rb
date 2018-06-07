class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_hash, null:false
      t.string :authorization_token, null: false

      t.timestamps
    end
    add_index :users, :authorization_token, unique:true
    add_index :users, :email, unique:true
  end
end
