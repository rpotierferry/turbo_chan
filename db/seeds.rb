require_relative 'feed_data'

Board.destroy_all
User.destroy_all
User.create!(
  email: "admin@admin.com",
  password: "AdMiN123456"
)

boards = seed_boards
boards.each do |b|
  Board.create!(
    name: b[:name],
    handle: b[:handle],
    category: b[:category],
    description: b[:description],
    private: false,
    user_id: User.last.id,
    official: true
  )
end

BoardThread.create!(
  board_id: Board.last.id,
  user_id: User.last.id,
  pinned: true
)

Post.create!(
  title: "Read the rules",
  is_op: true,
  board_thread_id: BoardThread.last.id,
  content: "Let's keep it civil",
  user_id: User.last.id
)
