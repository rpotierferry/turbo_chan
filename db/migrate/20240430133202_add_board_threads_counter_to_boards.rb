class AddBoardThreadsCounterToBoards < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :board_threads_count, :integer, default: 0
  end
end
