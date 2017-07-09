class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :event, polymorphic: true

  def mark_read
    self.read = true
  end
end
