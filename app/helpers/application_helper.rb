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
  def available_users(user)
     return false if user == current_user
     return false if current_user.friends.include?(user)
     return false if current_user.unconfirmed_requests.include?(user)
     return true
  end

  def show_btn(user) 
    if current_user.friends.include?(user)
     html_data = "<button class='btn btn-outline-success disabled'> already sent  </button> ".html_safe 
     return html_data
    end

  end

end
