class AddPinnedToBoardThreads < ActiveRecord::Migration[7.1]
  def change
    add_column :board_threads, :pinned, :boolean, default: false
  end
end
