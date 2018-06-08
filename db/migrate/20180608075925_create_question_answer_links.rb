class CreateQuestionAnswerLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :question_answer_links do |t|
      t.integer :question_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
