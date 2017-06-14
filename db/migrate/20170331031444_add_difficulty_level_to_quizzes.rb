class AddDifficultyLevelToQuizzes < ActiveRecord::Migration
  def change
    add_column("quizzes", "difficulty_level", :string, :limit => 6, :default => "medium")
    # set => "easy", "medium", "hard"
  end
end
