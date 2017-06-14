class Quiz < ActiveRecord::Base

  belongs_to :user
  has_many :questions


#  validates_inclusion_of :difficulty_level, in: %w( easy medium hard )

  # acts_as_list

  scope :sorted, lambda { order("quizzes.title ASC") }
  scope :user_quizzes, lambda { where(user_id: current_user.id)}


end
