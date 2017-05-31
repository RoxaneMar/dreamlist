module ApplicationHelper
  def user_avatar_tag(user, options = {})
    if user.avatar.present?
      cl_image_tag(user.avatar.path, options)
    else
      image_tag('http://placehold.it/50x50', options)
    end
  end


  def dream_picture_path(dream)
    if dream.picture.present?
      cl_image_path(dream.picture.path)
    else
      image_path("#{dream.category}")
    end
  end

  def like_action_for(dream)
    if current_user.liked?(dream)
      link_to(dream_like_path(dream), method: :delete, remote: true) do
        image_tag "coeur.png", class: "like"
      end
    else
      link_to(dream_like_path(dream), method: :post, remote: true) do
        image_tag "coeur-green.png", class: "like"
      end
    end
  end
end
