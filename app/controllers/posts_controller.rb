class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.order(:rating).reverse.first 10
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.author_ip = request.env['REMOTE_ADDR']
    
    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to @post }
        format.js { render action: 'create' }
      else
        flash[:notice] = 'Post was not created.'
        format.html { render action: 'new' }
        format.js { render action: 'create' }
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end
  
  # GET /posts_search
  def search
  end
  
  # POST /posts_find?rating_down=:rating_down&rating_up=:rating_up&date=:date
  def find
    @posts = Post.select do |post| 
      (post.rating.to_i >= find_post_params[:rating_down].to_i) and 
      (post.rating.to_i <= find_post_params[:rating_up].to_i)   and
      (post.created_at.to_date == find_post_params[:date].to_date)
    end
    if @posts.empty?
      flash[:notice] = 'Nothing!'
    else
      flash[:notice] = nil
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :description, :rating, :category_id)
    end
    
    def find_post_params
      params.require(:find_post).permit(:rating_down, :rating_up, :date)
    end
end
