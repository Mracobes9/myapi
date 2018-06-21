class CreateQuestionCategoryLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :question_category_links do |t|
      t.integer :question_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
    add_index :question_category_links, [:question_id, :category_id], unique:true
  end
end
