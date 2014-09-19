# encoding: UTF-8
class User < ActiveRecord::Base
  belongs_to :company
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable, :trackable, :validatable

  BASE_FIELDS = [:nickname, :email, :password, :password_confirmation, :role]
  # Setup accessible (or protected) attributes for your model
  attr_accessible *BASE_FIELDS
  attr_accessible *(BASE_FIELDS + [:id, :company_id]), :as => :seed
  
  validates :nickname, :uniqueness => true, :length => {:maximum => 15}
  validate :nickname_cannot_contain_invalid_characters
  
  def admin?
    self.role == 'admin'
  end
  
  def act_as_admin
    self.role = 'admin'
  end
  
  def act_as_user
    self.role = 'user'
  end
  
  private
  def nickname_cannot_contain_invalid_characters
    if self.nickname.present? and (
      self.nickname.include?('@') or
      self.nickname.include?('-') or
      self.nickname.include?(' ') or
      self.nickname.include?('.') or
      self.nickname.include?('/') or
      self.nickname.include?('\\')
                                  )
                                  errors.add(:nickname, "不能包含@，横线，斜线，句号或空格")
    end
  end
end
