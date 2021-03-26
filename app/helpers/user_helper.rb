module UserHelper

  def profile_btn(user)
    output = ''
    if !current_user.friend?(user)
      if current_user.pending_friends.include?(user) 
        output << "<p class='btn btn-info disabled'> Pending </p>"
      elsif current_user.friend_requests.include?(user) 
        output << "#{ link_to 'Accept', user_friendship_path(current_user, current_user.pending_friendship_ids[0] ), class:'btn btn-outline-primary', method: :patch }"
        output << "#{ link_to 'Deny', user_friendships_path(user) , class:'btn btn-outline-secondary' }"
      else 
        output << "<p class='px-2'>"
        output << "#{link_to 'Invite to Friend', user_friendships_path(user, current_user), class:'btn btn-secondary', method: :post }"
      output << "</p>"
      end 
    else 
      output << "<p class='btn btn-info disabled'> Friend </p>"
    end    
    output.html_safe
  end

  def friend
    output = ''

    if current_user.friends.none?
      output << '<p>You have no friends</p>'
    else
      current_user.friends.each do |friend|
      output << "<li> #{friend.name.capitalize} </li> "
      end
    end
    output.html_safe
  end

  def pending_friend_display
    output = ''
    if current_user.pending_friendships.none? 
      output << '<p>You have no pending friendships </p>'
    else
      current_user.pending_friendships.each do |friend|
      output << " 
      <br><h4>#{friend.user.name.capitalize}</h4><br>
      #{ link_to 'Accept', user_friendship_path(@user,pf.id), class:"btn btn-outline-primary", method: :patch }
      #{ link_to 'Deny', user_friendships_path(@user) , class:"btn btn-outline-secondary" } "
      end
    end
    output.html_safe
  end

end
