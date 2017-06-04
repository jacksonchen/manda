class Invite < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :sender, :class_name => 'User', optional: true
  belongs_to :recipient, :class_name => 'User', optional: true

  before_create :generate_token

  def generate_token
    puts "$$$$$$$$$$$$$$$$$$$$$$$$"
    self.token = Digest::SHA1.hexdigest([self.company_id, Time.now, rand].join)
  end
end
