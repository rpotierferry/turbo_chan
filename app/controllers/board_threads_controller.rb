class BoardThreadsController < ApplicationController
  def show
    @thread = BoardThread.find(params[:id])
    @board = Board.find(params[:board_id])
    @posts = @thread.posts
  end
  def new
    @board = Board.find(params[:board_id])
    @thread = BoardThread.new
    @post = Post.new
  end

  def create
    @thread = BoardThread.new
    @board = Board.find(params[:board_id])
    @thread.board = @board
    @post = Post.new(post_params)
    @post.is_op = true
    if current_user
      @post.name = current_user.username
    else
      @post.name = "Anonymous"
    end
    @post.board_thread = @thread
    if @thread.save && @post.save
      redirect_to board_board_thread_path(@board, @thread)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :photo, :photo_url)
  end
end
