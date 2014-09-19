# encoding: UTF-8
class Company < ActiveRecord::Base
  has_many :users
  BASE_FIELDS = [:name, :location, :tel, :fax, :email, :linkman, :zipcode]
  attr_accessible *BASE_FIELDS
  attr_accessible *(BASE_FIELDS + [:id]), :as => :seed

end