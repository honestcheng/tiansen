# encoding: utf-8
class Product < ActiveRecord::Base
  BASE_FIELDS = [:name, :category_id, :model, :price, :description, :pic_path, :position, :content]
  
  attr_accessible *BASE_FIELDS
  belongs_to :category
end
