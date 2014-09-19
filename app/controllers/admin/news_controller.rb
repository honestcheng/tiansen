# encoding: UTF-8
class Admin::NewsController < Admin::ApplicationController

  def index
    @news = News.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end

  def show
    @news = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json
    end
  end

  def new
    @news = News.new
    @categories = Category.type('news')
    respond_to do |format|
      format.html # new.html.erb
      format.json
    end
  end

  def edit
    @news = News.find(params[:id])
    @categories = Category.type('news')
  end

  def create
    @news = News.new(params[:news])

    respond_to do |format|
      if @news.save
        format.html { redirect_to(admin_news_index_path, :notice => 'News 创建成功。') }
        format.json
      else
        format.html { render :action => "new" }
        format.json
      end
    end
  end

  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to(admin_news_index_path, :notice => 'News 更新成功。') }
        format.json
      else
        format.html { render :action => "edit" }
        format.json
      end
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to(admin_news_index_path,:notice => "删除成功。") }
      format.json
    end
  end
end
