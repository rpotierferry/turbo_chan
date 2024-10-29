class BoardsController < ApplicationController
  before_action :set_board, only: %w[show create_board_sub]
  before_action :authenticate_user!, only: %w[create_board_sub]

  def index
    @boards = Board.all.group_by(&:category).sort
  end

  def show
    @user_is_sub = user_is_sub?(@board)
    @rule_thread = @board.board_threads.find_by(pinned: true)
    @rule_post = @rule_thread&.posts&.first
    @threads = @board.board_threads.includes(:posts).where(pinned: false)
    @thumbs = @threads.map do |thread|
      op_post = thread.posts.detect { |post| post.is_op }
      { thread: thread, op: op_post }
    end
  end

  def create_board_sub
    unless user_is_sub?(@board)
      Subscription.create(board: @board, user: current_user)
    end
    redirect_to board_path(@board), notice: "You are now subscribed to this board."
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def user_is_sub?(board)
    Subscription.exists?(user_id: current_user.id, board_id: board.id)
  end
end
