class AddPartialIndexToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_index :answers,[:question_id, :best], unique:true, where: "best=1"
  end
end
