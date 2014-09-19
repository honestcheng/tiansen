# encoding: UTF-8
class Admin::CategoriesController < Admin::ApplicationController
  before_filter :require_category_type
  
  def index
    @categories = Category.where("categoryable_type = ?", @category_type)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end

  def new
    @category = Category.new
    @category.categoryable_type = @category_type
    @url = admin_categories_path(@category_type)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json
    end
  end

  def edit
    @category = Category.find(params[:id])
    @url = show_admin_category_path(@category_type,@category.id)
  end

  def create
    @category = Category.new(params[:category])
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to(admin_categories_path(@category_type), :notice => 'Category 创建成功。') }
        format.json
      else
        format.html { render :action => "new" }
        format.json
      end
    end
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(admin_categories_path(@category_type), :notice => 'Category 更新成功。') }
        format.json
      else
        format.html { render :action => "edit" }
        format.json
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(admin_categories_path(@category_type),:notice => "删除成功。") }
      format.json
    end
  end
  
  private
  def require_category_type
    @category_type = Admin::CategoriesHelper::TYPE[params[:category_type]]
  end
end
