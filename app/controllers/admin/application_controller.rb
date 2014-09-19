# encoding: UTF-8
class Admin::ApplicationController < ApplicationController
  include Admin::ApplicationHelper
  before_filter :require_user
  
  layout 'admin_layout'
  
  def index
  end
  
  private
  def require_user
    if current_user.blank?
      respond_to do |format|
        format.html  {
          authenticate_user!
        }
        format.all {
          head(:unauthorized)
        }
      end
    end
  end
  
end
