# encoding: utf-8
class Page < ActiveRecord::Base
  BASE_FIELDS = [:title, :permalink, :content]
  
  attr_accessible *BASE_FIELDS
end
