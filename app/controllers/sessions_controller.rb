# encoding: UTF-8
class SessionsController < Devise::SessionsController
  layout 'admin_layout'
   
  def new
    super
    
    @title = "登入"
    @seo_description = @title
    session["user_return_to"] = request.referrer
  end
  
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    sign_in(resource_name, resource)
    
    redirect_to after_sign_in_path_for(resource)
  end
end
