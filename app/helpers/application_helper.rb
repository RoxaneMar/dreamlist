module ApplicationHelper
  def user_avatar_path(user)
    if user.avatar.present?
      user.avatar.path
    else
      'http://placehold.it/50x50'
    end
  end
end
