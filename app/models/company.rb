class Company < ApplicationRecord
  has_many :sellers
  has_one :buyer
  has_and_belongs_to_many :company_categories

  enum opportunity: {
    selling_entirely: 0,
    looking_for_opportunities: 1,
    selling_partly: 2
  }

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  has_attached_file :funding_report
  has_attached_file :userbase_analytics
  has_attached_file :llc
  has_attached_file :tax
  has_attached_file :equity_division

  validates :name, :presence => true
  validates :url, :presence => true
  validates :phone, :presence => true
  validates :founded, :presence => true
  validates :email, :presence => true
  validates :financials, :presence => true
  validates :originality, :presence => true
  validates :legal, :presence => true
  validates :price, :presence => true
  validates :logo, :presence => true

end
