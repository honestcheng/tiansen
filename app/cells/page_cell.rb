class PageCell < Cell::Rails
  include ApplicationHelper
  
  def show_company_info
    @company = Company.where('id = 1')[0]
    render 
  end
  
  def show_products_info
    @categories = Category.where('categoryable_type = "product"')
    render
  end

  def show_top_news_info
    @news = News.order('published_at desc').limit(10)
    render
  end
  
  def show_about_us_info
    render
  end
  
  def show_top_products_info
    @products = Product.order('updated_at desc').limit(10)
    render
  end
  
  def show_nav
    @cur_title = generate_nav(request.url)
    render
  end
end
