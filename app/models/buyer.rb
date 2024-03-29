class Buyer < ApplicationRecord
  belongs_to :user
  has_many :employers, as: :employable, dependent: :destroy
  has_many :companies
  has_many :conversations, dependent: :destroy
  has_many :offers, dependent: :destroy
  accepts_nested_attributes_for :employers, allow_destroy: true
  before_destroy :clear_employers

  enum gender: {
    male: 0,
    female: 1,
    other: 2
  }

  enum education: {
    lower: 0,
    high_school: 1,
    associate: 2,
    bachelor: 3,
    master: 4,
    professional: 5
  }

  validates :name, :presence => true
  validates :corporate_email, :presence => true
  validates_email_format_of :corporate_email, message: "is not valid"
  validates :phone, :presence => true
  validates :address, :presence => true
  validates :summary, :presence => true
  validates :business_role, :presence => true

  private

    def clear_employers
      self.employers.destroy_all
    end
end
