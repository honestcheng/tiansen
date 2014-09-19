require 'test_helper'

class Admin::FeedbacksControllerTest < ActionController::TestCase
  setup do
    @admin_feedback = admin_feedbacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_feedbacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_feedback" do
    assert_difference('Admin::Feedback.count') do
      post :create, admin_feedback: { content: @admin_feedback.content, name: @admin_feedback.name, qq: @admin_feedback.qq, tel: @admin_feedback.tel, title: @admin_feedback.title }
    end

    assert_redirected_to admin_feedback_path(assigns(:admin_feedback))
  end

  test "should show admin_feedback" do
    get :show, id: @admin_feedback
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_feedback
    assert_response :success
  end

  test "should update admin_feedback" do
    put :update, id: @admin_feedback, admin_feedback: { content: @admin_feedback.content, name: @admin_feedback.name, qq: @admin_feedback.qq, tel: @admin_feedback.tel, title: @admin_feedback.title }
    assert_redirected_to admin_feedback_path(assigns(:admin_feedback))
  end

  test "should destroy admin_feedback" do
    assert_difference('Admin::Feedback.count', -1) do
      delete :destroy, id: @admin_feedback
    end

    assert_redirected_to admin_feedbacks_path
  end
end
