class NotificationsController < ApplicationController
  def show
    notification = Notification.find(params[:id])
    notification.update(read: true)
    if notification.subject.is_a?(Dream)
      redirect_to notification.subject
    elsif notification.subject.is_a?(User)
      redirect_to dreams_profile_path(notification.subject)
    end
  end
end
