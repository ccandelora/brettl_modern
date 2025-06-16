require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get _articles_url
    assert_response :success
  end

  test "should get new" do
    get new__article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference("Article.count") do
      post _articles_url, params: { article: {} }
    end

    assert_redirected_to _article_url(Article.last)
  end

  test "should show article" do
    get _article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit__article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch _article_url(@article), params: { article: {} }
    assert_redirected_to _article_url(@article)
  end

  test "should destroy article" do
    assert_difference("Article.count", -1) do
      delete _article_url(@article)
    end

    assert_redirected_to _articles_url
  end
end
