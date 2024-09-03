class BoardThreadsController < ApplicationController
  before_action :authenticate_user!, only: ['create']
  before_action :set_board, only: ['show', 'new', 'create']
  before_action :set_thread, only: ['show']

  def show
    @op = @thread.posts.find_by(is_op: true)
    @posts = @thread.posts.where(is_op: false, type: nil).includes(:replies)
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
    @post.name = current_user.username
    @post.user_id = current_user.id
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
