require 'test_helper'

class InquiryesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get inquiryes_new_url
    assert_response :success
  end

end
