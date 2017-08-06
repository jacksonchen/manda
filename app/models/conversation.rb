class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  belongs_to :company
  belongs_to :buyer

  def getPartner(user)
    if user.buyer?
      return self.company.summary
    else
      return self.buyer.summary
    end
  end
end
