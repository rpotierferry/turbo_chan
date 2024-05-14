class BoardThreadsController < ApplicationController
  before_action :set_board, only: ['show', 'new', 'create']
  before_action :set_thread, only: ['show']

  def show
    @posts = @thread.posts
    @op = @posts.find(&:is_op)
    @posts = @posts.reject(&:is_op)
  end

  def new
    @thread = BoardThread.new
    @post = Post.new
  end

  def create
    @thread = BoardThread.new
    @thread.board = @board
    @post = Post.new(post_params)
    @post.is_op = true
    if current_user
      @post.name = current_user.username
    else
      @post.name = "Anonymous"
    end
    @post.board_thread = @thread
    if @post.save && @thread.save
      redirect_to board_board_thread_path(@board, @thread)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :photo, :photo_url)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_thread
    @thread = BoardThread.find(params[:id])
  end
end
