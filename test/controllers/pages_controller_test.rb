require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should root page" do
    get root_url
    assert_response :success
  end

  test "should get about page" do
    get about_url
    assert_response :success
  end

  test "should get contact page" do
    get contact_url
    assert_response :success
  end
end
