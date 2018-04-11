require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest


  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home |#{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help |#{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

#static_pages_about_urlなどはroutes.rbに記載されている内容に基づいて使用可能になる
#これらはrails ヘルパーと呼ばれる
end
