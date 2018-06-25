class AddForeignKeysToTables < ActiveRecord::Migration[5.2]
  def change
    #answers table
    add_foreign_key :users, :answers, on_delete: :cascade, on_update: :cascade
    add_foreign_key :questions, :answers, on_delete: :cascade, on_update: :cascade
    #question_category_links table
    add_foreign_key :questions, :question_category_links, on_delete: :cascade, on_update: :cascade
    add_foreign_key :categories, :question_category_links, on_delete: :cascade, on_update: :cascade
    #questions table
    add_foreign_key :users, :questions,on_delete: :cascade, on_update: :cascade
    #tokens
    add_foreign_key :users, :tokens, on_delete: :cascade, on_update: :cascade
  end
end
