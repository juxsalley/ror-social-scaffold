module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def link_to_post(post)
    return if post.user.nil?

    link_to post.user.name, user_path(post.user), class: 'post-author'
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def available_users?(user)
    return false if user == current_user
    return false if current_user.friends.include?(user)
    return false if current_user.unconfirmed_requests.include?(user)

    true
  end

  def allfriends(allfriends)
    if allfriends.empty?
      "<p class='border'>You have no friends yet</p>".html_safe
    else
      "<p class='border'>All friends</p>".html_safe
    end
  end

  def show_btn(user)
    return unless current_user.friends.include?(user)

    "<button class='btn btn-outline-success disabled'> already sent  </button> ".html_safe
  end

  def add_request(user)
    return unless available_users?(user)

    link_to 'Invite to friendship', friendships_path(receiver_id: user),
            method: :post, class: 'btn btn-outline-success mx-1'
  end

  def accept_request(req)
    link_to 'Accept', friendship_path(req),
            method: :patch, class: 'btn btn-outline-success mx-1'
  end

  def reject_request(req)
    link_to 'Reject', friendship_path(req),
            method: :delete, class: 'btn btn-outline-danger mx-1'
  end
end
