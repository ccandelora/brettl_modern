require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get body:text" do
    get comments_body:text_url
    assert_response :success
  end

  test "should get user:references" do
    get comments_user:references_url
    assert_response :success
  end

  test "should get article:references" do
    get comments_article:references_url
    assert_response :success
  end
end
