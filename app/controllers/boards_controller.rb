class BoardsController < ApplicationController
  def index
    @boards = Board.all.group_by(&:category)
  end

  def show
    @board = Board.find(params[:id])
    @rule_thread = @board.board_threads.find_by(pinned: true)
    if @rule_thread
      @rule_post = @rule_thread.posts.first
    end
  end

end
