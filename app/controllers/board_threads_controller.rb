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
    @thread.save
    @post = Post.new(post_params)
    @post.is_op = true
    @post.name = "Anonymous"
    @post.board_thread = @thread
    if @post.save
      redirect_to board_board_thread_path(@thread)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :photo)
  end
end
