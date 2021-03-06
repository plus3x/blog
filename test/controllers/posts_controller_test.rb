require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: {description: @post.description, title: @post.title, author_attributes: {name: @post.author}}
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { description: @post.description, rating: @post.rating, title: @post.title }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
  
  test "should get search" do
    get :search
    assert_response :success
  end
  
  test "should find posts" do
    xhr :post, :find, find_post: {rating_from: @post.rating - 1, rating_to: @post.rating + 1, date: @post.created_at.to_date.to_s}
    assert_equal assigns(:posts).first, @post
  end
end
