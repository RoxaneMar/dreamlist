module ApplicationHelper
  def user_avatar_tag(user)
    if user.avatar.present?
      cl_image_tag(user.avatar.path)
    else
      image_tag('http://placehold.it/50x50')
    end
  end


  def dream_picture_path(dream)
    if dream.picture.present?
      cl_image_path(dream.picture.path)
    else
      image_path("#{dream.category}")
    end
  end
end
