# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Company.delete_all

company = Company.new
company.assign_attributes({
  :id => 1,
  :name => "南阳天森肥业有限公司",
  :location => "镇平遮山工业经济开发区",
  :tel => "0377-65800188",
  :fax => "2807941688",
  :email => "",
  :linkman => "杨经理",
  :zipcode => ""
  }, :as => :seed)

company.save!

#add default admin
User.delete_all

user = User.new
user.assign_attributes({
  :id => 1,
  :company_id => 1,
  :nickname => "admin",
  :email => "admin@admin.com",
  :password => "000000",
  :password_confirmation => "000000",
  :role => "admin"
}, :as => :seed)
user.save!