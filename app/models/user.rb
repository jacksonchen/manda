class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:linkedin]

  has_one :buyer, dependent: :destroy
  has_one :seller, dependent: :destroy
  has_many :invitations, :class_name => "Invite", :foreign_key => 'recipient_id'
  has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'
  has_many :messages
  has_many :messages_received, class_name: "Message", as: :recipient
  has_many :conversations, -> { distinct }, through: :messages
  has_many :notifications

  attr_accessor :token #Virtual attribute for token

  enum user_type: {
    buyer: 0,
    seller: 1,
    admin: 2
  }

   def self.from_omniauth(auth)
       where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
         user.provider = auth.provider
         user.uid = auth.uid
         user.email = auth.info.email
         user.password = Devise.friendly_token[0,20]
       end
   end

   def name
     if !self.buyer.nil?
       return self.buyer.name
     elsif !self.seller.nil?
       return self.seller.name
     else
       return nil
     end
   end

   def has_notifications
     return self.notifications.where(read: false).count
   end

   protected
    def confirmation_required?
      true
    end
end
