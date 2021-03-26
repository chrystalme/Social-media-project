module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

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
end
