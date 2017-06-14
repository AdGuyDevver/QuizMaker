class User < ActiveRecord::Base

  has_many :quizzes


  scope :sorted, lambda { order("users.username ASC") }

  before_save { self.email = email.downcase }
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :first_name, :presence => true, :length => {:maximum => 25}
  validates :last_name, :presence => true, :length => {:maximum => 50}
  validates :username, :presence => true, :uniqueness => true, :length => {:minimum => 6}
  validates :email, :presence => true, :format => { :with => EMAIL_REGEX } #, :confirmation => true

  has_secure_password
  validates :password, :presence => true,
                    :length => { :maximum => 100 },
                    :confirmation => true
                    # uniqueness: { case_sensitive: false }


  def name
    "#{first_name} #{last_name}"
  end

  def is_super_admin?(user)
    return true if user.is_super_admin == true
  end

  # def is_admin?(user)
  #   return true if user.is_admin == true
  # end

  # def month_year_created
  #   self.created_at.strftime(%B %Y)
  # end

end
