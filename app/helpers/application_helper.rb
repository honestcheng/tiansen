# coding: utf-8
module ApplicationHelper
  def generate_nav(url)
    if url.include? "news"
      "新闻中心"
    elsif url.include? "products"
      "产品中心"
    elsif url.include? "about-us"
      "关于我们"
    elsif url.include? "contact-us"
      "联系我们"
    elsif url.include? "equipment"
      "厂房设备"
    elsif url.include? "honor"
      "资质荣誉"
    else
      ""
    end
  end
end
