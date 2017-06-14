class Question < ActiveRecord::Base

  belongs_to :quiz

  scope :sorted, lambda { order("questions.created_at ASC") }
  scope :user_questions, lambda { where(quiz_id: @quiz.id)}

  # acts_as_list

  def self.quiz_questions(quiz_id)
    where("quiz_id: ?", quiz_id)
    self.all(:conditions => { :quiz_ => true })
  end

  def get_quiz_questions(quiz_id)
    quiz_questions = Questions.find_all_by_quiz_id(quiz_id)
  end

end
