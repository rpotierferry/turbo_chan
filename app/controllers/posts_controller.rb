class PostsController < ApplicationController
  def new
    set_board_and_thread
    @post = Post.new
  end

  def create
    set_board_and_thread
    @post = @thread.posts.build(post_params)
    @post.board_thread = @thread
    @post = set_post_name(@post)
    if @post.save
      redirect_to board_board_thread_path(@board, @thread)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def upvote
    setup_vote
    @upvote = @post.votes.build(value: 1)
    @upvote.user = current_user
    if @upvote.save
      redirect_to board_board_thread_path(@board, @thread)
    end
  end

  def downvote
    setup_vote
    @upvote = @post.votes.build(value: -1)
    @upvote.user = current_user
    if @upvote.save
      redirect_to board_board_thread_path(@board, @thread)
    end
  end

  def new_reply
    set_board_and_thread
    @post = Post.find(params[:id])
    @reply = Reply.new
  end

  def create_reply
    set_board_and_thread
    @post = Post.find(params[:id])
    @reply = @post.replies.build(reply_params)
    @reply = set_post_name(@reply)
    @reply.type = "Reply"
    @reply.photo_url = nil if @reply.photo_url.blank?
    if @reply.save
      respond_to do |format|
        format.html { redirect_to board_board_thread_path(@board, @thread), notice: "Reply created" }
        format.turbo_stream
      end
    else
      render :new_reply, status: :unprocessable_entity
    end
  end

  private

  def set_post_name(post)
    if current_user
      post.name = current_user.username
      post.user_id = current_user.id
    else
      post.name = 'Anonymous'
    end
    post
  end

  def set_board_and_thread
    @board = Board.find(params[:board_id])
    @thread = BoardThread.find(params[:board_thread_id])
  end

  def setup_vote
    @post = Post.find(params[:id])
    @board = Board.find(params[:board_id])
    @thread = BoardThread.find(params[:board_thread_id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :photo, :photo_url)
  end

  def reply_params
    params.require(:reply).permit(:content, :photo, :photo_url)
  end
end
