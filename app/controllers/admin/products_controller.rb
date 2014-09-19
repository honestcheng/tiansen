# encoding: UTF-8
class Admin::ProductsController < Admin::ApplicationController
  
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json
    end
  end

  def new
    @product = Product.new
    @categories = Category.type('product')
    respond_to do |format|
      format.html # new.html.erb
      format.json
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.type('product')
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to(admin_products_path, :notice => 'Product 创建成功。') }
        format.json
      else
        format.html { render :action => "new" }
        format.json
      end
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(admin_products_path, :notice => 'Product 更新成功。') }
        format.json
      else
        format.html { render :action => "edit" }
        format.json
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(admin_products_path,:notice => "删除成功。") }
      format.json
    end
  end
end
