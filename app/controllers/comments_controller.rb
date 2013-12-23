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
    puts "Comment post: #{@comment.post}"
  end

  # GET /post/:post_id/comments/1/edit
  def edit
  end

  # POST /post/:post_id/comments
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find_by(id: params[:post_id])
    @comment.post = @post
    puts "Comment post: #{@comment.post}"
    @comment.author_ip = request.env['REMOTE_ADDR']
    
    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.' 
        format.html { redirect_to @comment }
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
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /post/:post_id/comments/1
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:description, :author_ip, :post_id)
    end
end
