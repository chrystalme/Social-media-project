module UserHelper

  def friend
    output = ''

    if current_user.friends.none?
      output << "<p>You have no friends</p>"
    else
      current_user.friends.each do |friend|
      output << "<li> #{friend.name.capitalize} </li> <br>"
      end
    end
    output.html_safe
  end

  def pending_friend_display
  end

end
