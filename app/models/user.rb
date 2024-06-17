class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :votes

  def upvotes?(post)
    post.votes.where(user_id: id).any? && post.votes.find_by(user_id: id).value == 1
  end

  def downvotes?(post)
    post.votes.where(user_id: id).any? && post.votes.find_by(user_id: id).value == -1
  end
end
