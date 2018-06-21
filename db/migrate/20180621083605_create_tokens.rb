class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.string :token, null:false
      t.integer :user_id, null:false

      t.timestamps
    end
    add_index :tokens, :token, unique: true
  end
end
