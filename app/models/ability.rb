# encoding: UTF-8
#not use
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :update, Company do |company|
      user.company == company
    end
  end
end
