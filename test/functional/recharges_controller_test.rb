require 'test_helper'

class RechargesControllerTest < ActionController::TestCase
  setup do
    @recharge = recharges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recharges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recharge" do
    assert_difference('Recharge.count') do
      post :create, recharge: { operator: @recharge.operator, recharge_amount: @recharge.recharge_amount, recharge_date: @recharge.recharge_date, remark: @recharge.remark, user_id: @recharge.user_id }
    end

    assert_redirected_to recharge_path(assigns(:recharge))
  end

  test "should show recharge" do
    get :show, id: @recharge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recharge
    assert_response :success
  end

  test "should update recharge" do
    put :update, id: @recharge, recharge: { operator: @recharge.operator, recharge_amount: @recharge.recharge_amount, recharge_date: @recharge.recharge_date, remark: @recharge.remark, user_id: @recharge.user_id }
    assert_redirected_to recharge_path(assigns(:recharge))
  end

  test "should destroy recharge" do
    assert_difference('Recharge.count', -1) do
      delete :destroy, id: @recharge
    end

    assert_redirected_to recharges_path
  end
end
