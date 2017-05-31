module ApplicationHelper
  def user_avatar_path(user)
    if user.avatar.present?
      user.avatar.path
    else
      'http://placehold.it/50x50'
    end
  end


  def dream_picture_path(dream)
    if dream.picture.present?
      dream.picture.path
    else
      image_path("dream.category}")
    end
  end
end
