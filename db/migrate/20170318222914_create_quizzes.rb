class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.integer :number_of_questions, :default => 5

      t.timestamps null: false
    end
  end
end
