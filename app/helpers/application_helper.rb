module ApplicationHelper
  def user_avatar_tag(user, options = {})
    if user.avatar.present?
      cl_image_tag(user.avatar.path, options)
    else
      image_tag('http://placehold.it/50x50', options)
    end
  end

  def dream_picture_path(dream, options = {})
    if dream.picture.present?
      cl_image_path(dream.picture.path, options)
    else
      image_path("#{dream.category}")
    end
  end

  def like_action_for(dream)
    if current_user.present?
      if current_user.liked?(dream)
        link_to(dream_like_path(dream), method: :delete, remote: true) do
          image_tag "coeur.png", class: "like"
        end
      else
        link_to(dream_like_path(dream), method: :post, remote: true) do
          image_tag "coeur-green.png", class: "like"
        end
      end
    else
      link_to(new_user_session_path) do
        image_tag "coeur-green.png", class: "like"
      end
    end
  end

  def like_action_gray_for(dream)
    if current_user.present?
      if current_user.liked?(dream)
        link_to(dream_like_path(dream), method: :delete, remote: true) do
          image_tag "like-gray-full.png", class: "like"
        end
      else
        link_to(dream_like_path(dream), method: :post, remote: true) do
          image_tag "like-gray.png", class: "like"
        end
      end
    else
      link_to(new_user_session_path) do
        image_tag "love-gray.png", class: "like"
      end
    end
  end
end
