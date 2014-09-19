# encoding: UTF-8
class Admin::CompaniesController < Admin::ApplicationController
  def edit
    user = current_user
    @company = Company.find(user.company_id)
  end

  def update
    @company = Company.find(current_user.company_id)

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to(admin_company_edit_path, :notice => 'Company 更新成功。') }
        format.json
      else
        format.html { render :action => "edit" }
        format.json
      end
    end
  end
end
