require 'test_helper'

class CartsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get carts_controller_show_url
    assert_response :success
  end

end
