class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def timeline_posts
    # @timeline_posts ||= Post.where("user_id = ?", current_user.friends ).ordered_by_most_recent.includes(:user)
    @timeline_posts = []
    Post.all.ordered_by_most_recent.each do |post|
      if post.user_id == current_user.id
        @timeline_posts << post
      end
      current_user.friends.each do |i|
        if post.user_id == i.id
          @timeline_posts << post
        end
      end
    end
    @timeline_posts
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
