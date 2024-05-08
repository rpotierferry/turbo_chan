class PostsController < ApplicationController
  def new
    set_board_and_thread
    @post = Post.new
  end

  def create
    set_board_and_thread
    @post = @thread.posts.build(post_params)
    @post.board_thread = @thread
    @post.name = 'Anonymous'
    if @post.save
      redirect_to board_board_thread_path(@board, @thread)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private


  def set_board_and_thread
    @board = Board.find(params[:board_id])
    @thread = BoardThread.find(params[:board_thread_id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :photo, :photo_url)
  end
end
