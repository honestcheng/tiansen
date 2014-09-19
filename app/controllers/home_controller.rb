# encoding: UTF-8
class HomeController < ApplicationController
  def index
    @company = Company.find(1)
  end
end
