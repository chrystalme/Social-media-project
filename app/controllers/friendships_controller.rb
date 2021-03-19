class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(friend_id: params[:user_id])
    if @friendship.save
      flash[:notice] = "Friend request has been sent to #{user.name}."
      redirect_to users_path
    else
      render 'new'
    end
  end

  def accept
    @friendship = current_user.friendships.update(friend_id: params[:user_id], status: true)
    if @friendship.save
      flash[:notice] = "#{user.name} accepted your frienship request."
    end
    redirect_to users_path
  end

  private

  def user
    @friend = User.find(params[:user_id])
  end
end
