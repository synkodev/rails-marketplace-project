require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get carts_create_url
    assert_response :success
  end
end
