# encoding: utf-8
class Feedback < ActiveRecord::Base
  BASE_FIELDS = [:name, :tel, :qq, :title, :content, :ip, :ua]
  attr_accessible *BASE_FIELDS
  attr_accessible *(BASE_FIELDS + [:flag]), :as => :admin
  
  validates_presence_of :name, :tel, :content
  validates :name, :length => {:maximum => 100}
  validates :tel, :length => {:maximum => 100}
  validates :qq, :length => {:maximum => 100}
  validates :title, :length => {:maximum => 100}
  validates :content, :length => {:maximum => 250}
  
end
