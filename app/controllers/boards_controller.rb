class BoardsController < ApplicationController
  def index
    @boards = Board.all.group_by(&:category).sort
  end

  def show
    @board = Board.find(params[:id])
    @rule_thread = @board.board_threads.find_by(pinned: true)
    if @rule_thread
      @rule_post = @rule_thread.posts.first
    end
    @threads = @board.board_threads.includes(:posts).where(pinned: false)

    @thumbs = @threads.map do |thread|
      op_post = thread.posts.detect { |post| post.is_op }
      {
        thread: thread,
        op: op_post
      }
    end
  end
end
