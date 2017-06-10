class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users
  belongs_to :company
end
