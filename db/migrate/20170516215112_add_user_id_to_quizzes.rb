class AddUserIdToQuizzes < ActiveRecord::Migration
  def change
    add_column "quizzes", "user_id", :integer, foreign_key: true, null: false, default: 11
    add_index "quizzes", "user_id"
  end
end
