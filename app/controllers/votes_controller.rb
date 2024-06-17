class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def upvote
    if current_user.upvotes?(@post)
      current_user.votes.find_by(post_id: @post.id).destroy
    elsif current_user.downvotes?(@post)
      current_user.votes.find_by(post_id: @post.id).update(value: 1)
    else
      @upvote = @post.votes.build(value: 1)
      @upvote.user = current_user
      @upvote.save
    end
    redirect_to board_board_thread_path(@board, @thread)
  end

  def downvote
    if current_user.downvotes?(@post)
      current_user.votes.find_by(post_id: @post.id).destroy
    elsif current_user.upvotes?(@post)
      current_user.votes.find_by(post_id: @post.id).update(value: -1)
    else
      @upvote = @post.votes.build(value: -1)
      @upvote.user = current_user
      @upvote.save
    end
    redirect_to board_board_thread_path(@board, @thread)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
    @thread = @post.board_thread
    @board = @thread.board
  end

end
