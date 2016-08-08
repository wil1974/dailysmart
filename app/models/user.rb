class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Could use database to set default role to student, but will be difficult
  #to change defaults later on without worrying effect on code
  #after_initialize : a callback that occurs when User model is instantiated
  #after_create should not be used as it would override any other value we may
  #have integrated on the fly
  after_initialize :set_defaults

  validates_presence_of :first_name, :last_name
  validates :username, uniqueness: true, presence: true,
                    format: {with: /\A[a-zA-Z]+([a-zA-Z]|\d)*\Z/ }

  private
  def set_defaults
    self.role ||= 'student'
  end
end
