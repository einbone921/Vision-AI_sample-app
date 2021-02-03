require 'test_helper'

class PostImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get post_images_show_url
    assert_response :success
  end

end
