class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :event, polymorphic: true
end
