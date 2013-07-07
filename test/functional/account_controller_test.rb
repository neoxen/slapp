require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

end
