class Board < ApplicationRecord
  before_create :assign_b_id
  has_many :board_threads, dependent: :destroy
  belongs_to :subscriptions

  validates :name, :handle, :category, :description, presence: true
  validates :handle, uniqueness: true, format: { with: %r{/\w+/} }

  private

  def assign_b_id
    max_id = Board.maximum(:b_id) || 0
    self.b_id = max_id + 1
  end
end
