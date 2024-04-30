class BoardThread < ApplicationRecord
  before_create :assign_bt_id
  belongs_to :board, counter_cache: true
  has_many :posts, dependent: :destroy

  private

  def assign_bt_id
    max_id = BoardThread.maximum(:bt_id) || 0
    self.bt_id = max_id + 1
  end
end
