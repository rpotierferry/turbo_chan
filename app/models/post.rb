class Post < ApplicationRecord
  before_create :assign_p_id
  belongs_to :board_thread, counter_cache: true

  has_many :votes, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true, if: :op?, length: { minimum: 6, maximum: 64 }
  validates :content, presence: true, if: :op?, length: { maximum: 256 }
  validates :photo, presence: true, if: :op?

  private

  def assign_p_id
    max_id = Post.maximum(:p_id) || 0
    self.p_id = max_id + 1
  end

  def op?
    self.is_op
  end
end
