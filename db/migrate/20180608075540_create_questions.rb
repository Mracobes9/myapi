class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :desc, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :questions, :user_id
  end
end
