class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(friend_id: params[:user_id])
    if @friendship.save
      flash[:notice] = "Friend request has been sent to #{user.name.capitalize}"
      redirect_to users_path
    else
      render 'new'
    end
  end

  # Accept Friendship
  def update
    @friendship = Friendship.find_by_id(params[:id])
    @friendship.status = true
    flash[:notice] = "You accepted friend request from #{@friendship.user.name.capitalize}" if @friendship.save
    redirect_to root_path
  end

  private

  def user
    @friend = User.find(params[:user_id])
  end
end
