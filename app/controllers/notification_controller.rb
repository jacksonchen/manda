class NotificationController < ApplicationController
  def update_read
    @notification = Notification.find(params[:id])
    @notification.read = true
    @notification.save
  end
end
