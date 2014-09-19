# encoding: utf-8
class News < ActiveRecord::Base
  BASE_FIELDS = [:title, :sub_title, :published_at, :category_id, :position, :content]
  attr_accessible *BASE_FIELDS
  
  belongs_to :category
end
