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
      image_path("#{dream.category}", options)
    end
  end
end
