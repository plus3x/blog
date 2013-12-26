require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get :index, post_id: @comment.post
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    get :new, post_id: @comment.post
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, post_id: @comment.post, comment: {description: @comment.description, rating: 3, author_attributes: {name: @comment.author}}
    end

    assert_redirected_to [@comment.post, assigns(:comment)]
  end

  test "should show comment" do
    get :show, post_id: @comment.post, id: @comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, post_id: @comment.post, id: @comment
    assert_response :success
  end

  test "should update comment" do
    patch :update, post_id: @comment.post, id: @comment, comment: {description: @comment.description, rating: 3, author_attributes: {name: @comment.author}}
    assert_redirected_to [@comment.post, assigns(:comment)]
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, post_id: @comment.post, id: @comment
    end

    assert_redirected_to posts_url
  end
end
