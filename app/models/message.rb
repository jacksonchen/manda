class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  belongs_to :recipient, polymorphic: true
  has_many :notifications, as: :event

  after_create :send_notification

  private
    def send_notification()
      if self.recipient.instance_of? Company
        self.recipient.sellers.each do |seller|
          self.notifications.create(user: seller.user)
        end
      else
        self.notifications.create(user: self.recipient.user)
      end
    end
end
