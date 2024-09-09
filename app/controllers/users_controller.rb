class UsersController < ApplicationController
  before_action :set_user, only: %w[show see_posts see_replies see_subscriptions]
  def show
    @user = User.find(current_user.id)
  end

  def see_posts
    @posts = @user.posts.where(is_op: true)
  end

  def see_replies
    @replies = @user.posts.where(is_op: false)
  end

  def see_subscriptions
    @subs = @user.subscriptions
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
end
