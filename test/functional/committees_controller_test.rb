require 'test_helper'

class CommitteesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:committees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create committee" do
    assert_difference('Committee.count') do
      post :create, :committee => { }
    end

    assert_redirected_to committee_path(assigns(:committee))
  end

  test "should show committee" do
    get :show, :id => committees(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => committees(:one).to_param
    assert_response :success
  end

  test "should update committee" do
    put :update, :id => committees(:one).to_param, :committee => { }
    assert_redirected_to committee_path(assigns(:committee))
  end

  test "should destroy committee" do
    assert_difference('Committee.count', -1) do
      delete :destroy, :id => committees(:one).to_param
    end

    assert_redirected_to committees_path
  end
end
