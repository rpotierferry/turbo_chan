class Board < ApplicationRecord
  before_create :assign_b_id
  has_many :board_threads, dependent: :destroy

  private

  def assign_b_id
    max_id = Board.maximum(:b_id) || 0
    self.b_id = max_id + 1
  end
end
