class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /post/:post_id/comments
  def index
    @comments = Comment.all
  end

  # GET /post/:post_id/comments/1
  def show
  end

  # GET /post/:post_id/comments/new
  def new
    @comment = Comment.new
    @comment.post = Post.find_by(id: params[:post_id])
    @comment.build_author
  end

  # GET /post/:post_id/comments/1/edit
  def edit
  end

  # POST /post/:post_id/comments
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find_by(id: params[:post_id])
    @comment.post = @post
    if author = Author.find_by(name: comment_params[:author_attributes][:name])
      @comment.author = author
    end
    @comment.author_ip = request.env['REMOTE_ADDR']
    
    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to [@post, @comment] }
        format.js { render action: 'create' }
      else
        flash[:notice] = 'Comment was not created.'
        format.html { render action: 'new' }
        format.js { render action: 'create' }
      end
    end
  end

  # PATCH/PUT /post/:post_id/comments/1
  def update
    if @comment.update(comment_params)
      redirect_to [@comment.post, @comment], notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /post/:post_id/comments/1
  def destroy
    @comment.destroy
    redirect_to posts_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:description, :rating, author_attributes: [:name])
    end
end
