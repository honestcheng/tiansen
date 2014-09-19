# encoding: UTF-8
class NewsController < ApplicationController
  def index
    @news = News.order("updated_at desc")
  end

  def show
    @news = News.find(params[:id])
  end
end
