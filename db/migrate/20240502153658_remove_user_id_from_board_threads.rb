class RemoveUserIdFromBoardThreads < ActiveRecord::Migration[7.1]
  def change
    remove_column :board_threads, :user_id, :big_int
  end
end
