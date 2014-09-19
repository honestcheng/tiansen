# encoding: utf-8
class Category < ActiveRecord::Base
  attr_accessible :name, :position, :categoryable_type, :user_id, :company_id
  has_many :news
  has_many :products
  
  scope :type, lambda {|x| where('categoryable_type = ?', x)}
end
