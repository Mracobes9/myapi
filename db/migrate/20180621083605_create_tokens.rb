class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.string :token
      t.integer :user_id

      t.timestamps
    end
    add_index :tokens, :user_id, unique: true
  end
end
