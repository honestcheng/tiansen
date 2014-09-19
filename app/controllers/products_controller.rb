# encoding: UTF-8
class ProductsController < ApplicationController
  def index
    @products = params[:category_id].nil? ? Product.all : Product.where('category_id = ?',params[:category_id])
  end

  def show
    @product = Product.find(params[:id])
  end
end
