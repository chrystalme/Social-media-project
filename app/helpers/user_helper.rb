module UserHelper

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
