class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :text, null:false
      t.integer :user_id, null:false
      t.boolean :best, null:false, default: false

      t.timestamps
    end
    add_index :answers, :user_id
  end
end
