# encoding: UTF-8
class Admin::FeedbacksController < Admin::ApplicationController

  def index
    @feedbacks = Feedback.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end

  def show
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json
    end
  end

  def new
    @feedback = Feedback.new

    respond_to do |format|
      format.html # new.html.erb
      format.json
    end
  end

  def edit
    @feedback = Feedback.find(params[:id])
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    @feedback.company_id = current_user.company_id
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to(admin_feedbacks_path, :notice => 'Feedback 创建成功。') }
        format.json
      else
        format.html { render :action => "new" }
        format.json
      end
    end
  end

  def update
    @feedback = Feedback.find(params[:id])
    @feedback.company_id = current_user.company_id
    respond_to do |format|
      if @feedback.update_attributes(params[:feedback])
        format.html { redirect_to(admin_feedbacks_path, :notice => 'Feedback 更新成功。') }
        format.json
      else
        format.html { render :action => "edit" }
        format.json
      end
    end
  end

  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to(admin_feedbacks_path,:notice => "删除成功。") }
      format.json
    end
  end
end
