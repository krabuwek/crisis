require 'test_helper'

class ResponseControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get response_create_url
    assert_response :success
  end

end
