# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  
  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = t('tips.no_permission')
    redirect_to root_url, :alert => exception.message
  end
  
  rescue_from ActiveRecord::RecordNotFound do |exception|
    case request.format.to_sym
    when :html
      @title = '404: Not Found'
      @note = '你要访问的页面不存在'
      @exception = exception
      render 'home/404' and return
    when :js
      render :json => {:error => 'record not found'}, :status => :not_found and return
    end
  end
  
  rescue_from NoMethodError, RuntimeError do |exception|
    logger.error exception.message
    exception.backtrace.each {|line| logger.error line}
    
    case request.format.to_sym
    when :html
      @title = '500: Internal Error'
      @note = '不好意思，系统运行遇到了错误'
      @exception = exception
      render 'home/500' and return
    when :js
      render :json => {:error => exception.inspect}, :status => :internal_server_error and return
    end
  end
  
  private
  def after_sign_out_path_for(resource_for_scope)
    root_path
  end
  
  def after_sign_in_path_for(resource_for_scope)
    admin_root_path
  end
end
