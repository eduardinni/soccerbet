require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get rules" do
    get :rules
    assert_response :success
  end

end
