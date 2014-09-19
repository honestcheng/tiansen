class PagesController < ApplicationController
  def show
    permalink = params[:permalink]
    @page = Page.find_by_permalink(permalink)
    @page = Page.new if @page.nil?
  end
end
