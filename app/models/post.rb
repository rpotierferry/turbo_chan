class Post < ApplicationRecord
  before_create :assign_p_id
  belongs_to :board_thread, counter_cache: true
  has_many :votes, dependent: :destroy

  private

  def assign_p_id
    max_id = Post.maximum(:p_id) || 0
    self.p_id = max_id + 1
  end
end
