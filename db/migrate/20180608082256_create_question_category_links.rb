class CreateQuestionCategoryLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :question_category_links do |t|
      t.integer :question_id
      t.integer :category_id

      t.timestamps
    end
  end
end
