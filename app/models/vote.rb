class Vote < ApplicationRecord
  belongs_to :post
  belongs_to :user
  after_create :update_post_rating
  after_destroy :update_post_rating
  after_update :update_post_rating

  private

  def update_post_rating
    new_rating = post.votes.sum(:value)
    post.update(rating: new_rating)
  end
end
