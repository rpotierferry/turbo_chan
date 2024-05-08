require_relative 'feed_data'
require 'open-uri'

Board.destroy_all
User.destroy_all
User.create!(
  email: 'admin@admin.com',
  password: 'AdMiN123456',
  username: 'Admin'
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
  pinned: true
)

Post.create!(
  title: 'Read the rules',
  is_op: true,
  board_thread_id: BoardThread.last.id,
  content: "Let's keep it civil",
  user_id: User.last.id,
  photo_url: 'https://res.cloudinary.com/dggojsppa/image/upload/v1714648490/development/wfp5h0ix6ri8y6nsy6ynyze0sgqy.webp'
)

Vote.create!(
  user_id: User.last.id,
  post_id: Post.last.id
)

BoardThread.create!(
  board_id: Board.first.id
)

Post.create(
  title: 'Best game thread?',
  content: 'Best game thread',
  name: 'Anonymous',
  photo_url: 'https://res.cloudinary.com/dggojsppa/image/upload/v1713532582/development/eb6er8x336wzc7uykew036lx07e1.webp',
  is_op: true,
  board_thread_id: BoardThread.last.id
)

Post.create(
  content: 'Beg to differ here',
  name: 'Anonymous',
  photo_url: 'https://res.cloudinary.com/dggojsppa/image/upload/v1713548867/development/mdoc1drbpj0l3wxclynin7o30f50.jpg',
  board_thread_id: BoardThread.last.id
)

Post.create(
  content: "Stop fighting we all know it's pic related",
  name: 'Anonymous',
  photo_url: 'https://res.cloudinary.com/dggojsppa/image/upload/v1713535187/development/og8xdqcn9j71mhln0k68byxu48r0.jpg',
  board_thread_id: BoardThread.last.id
)
