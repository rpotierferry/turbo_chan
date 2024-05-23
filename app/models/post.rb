class Post < ApplicationRecord
  before_create :assign_p_id
  belongs_to :board_thread, counter_cache: true

  has_many :votes, dependent: :destroy
  has_many :replies, class_name: 'Post', foreign_key: 'parent_post_id', dependent: :destroy
  belongs_to :parent_post, class_name: 'Post', optional: true

  has_one_attached :photo

  validates :title, presence: true, if: :op?, length: { minimum: 6, maximum: 64 }
  validates :content, presence: true, if: :op?, length: { maximum: 256 }
  validate :photo_or_url_present, if: :op?

  before_validation :inherit_board_id_from_parent

  private

  def assign_p_id
    max_id = Post.maximum(:p_id) || 0
    self.p_id = max_id + 1
  end

  def op?
    self.is_op
  end

  def photo_or_url_present
    unless photo.attached? || photo_url.present?
      errors.add(:photo, 'or photo url must be present')
    end
  end

  def inherit_board_id_from_parent
    self.board_thread_id = parent_post.board_thread_id if parent_post.present?
  end
end
