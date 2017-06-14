class AddQuizIdToQuestions < ActiveRecord::Migration
  def change
    add_column "questions", "quiz_id", :integer, foreign_key: true
    add_index "questions", "quiz_id"
    #t.references :quiz, foreign_key: true
  end
end
