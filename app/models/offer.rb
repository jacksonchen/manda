class Offer < ApplicationRecord
  belongs_to :company
  belongs_to :buyer
  has_many :notifications, as: :event, dependent: :destroy

  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }

  after_create :send_notification

  private
    def send_notification()
      self.company.sellers.each do |seller|
        self.notifications.create(user: seller.user)
      end
    end
end
