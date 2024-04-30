class AddPostsCountToBoardThreads < ActiveRecord::Migration[7.1]
  def change
    add_column :board_threads, :posts_count, :integer, default: 0
  end
end
