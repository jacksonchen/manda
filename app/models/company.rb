class Company < ApplicationRecord
  has_many :sellers
  has_many :invites
  has_many :conversations, dependent: :destroy
  has_many :messages, as: :recipient
  has_many :offers, dependent: :destroy
  belongs_to :buyer, optional: true
  has_and_belongs_to_many :company_categories
  accepts_nested_attributes_for :sellers, allow_destroy: true
  accepts_nested_attributes_for :invites, allow_destroy: true

  enum opportunity: {
    selling_entirely: 0,
    looking_for_opportunities: 1,
    selling_partly: 2
  }

  enum approval: {
    rejected: 0,
    pending: 1,
    approved: 2,
  }

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png", validate_media_type: false
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  has_attached_file :funding_report
  has_attached_file :userbase_analytics
  has_attached_file :finances
  has_attached_file :llc
  has_attached_file :tax
  has_attached_file :equity_division

  validates :name, :presence => true
  validates :url, :presence => true
  validates :phone, :presence => true
  validates :founded, :presence => true
  validates :email, :presence => true
  validates_email_format_of :email, message: "is not valid"
  validates :financials, :presence => true
  validates :originality, :presence => true
  validates :legal, :presence => true
  validates :price, :presence => true
  validates :approval, :presence => true
  validates :summary, length: { maximum: 100 }

  validates_attachment :logo,
    content_type: { content_type: ["image/jpeg", "image/png", "image/svg+xml"] },
    size: { in: 0..3.megabytes }

  validates_attachment :funding_report,
    content_type: { content_type: ["application/pdf",
                                   "application/msword",
                                   "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                   "application/vnd.ms-excel",
                                   "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                   "image/jpeg",
                                   "image/png"] },
    size: { in: 0..10.megabytes }

  validates_attachment :userbase_analytics,
    content_type: { content_type: ["application/pdf",
                                   "application/msword",
                                   "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                   "application/vnd.ms-excel",
                                   "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                   "image/jpeg",
                                   "image/png"] },
    size: { in: 0..10.megabytes }

  validates_attachment :finances,
    content_type: { content_type: ["application/pdf",
                                   "application/msword",
                                   "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                   "application/vnd.ms-excel",
                                   "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                   "image/jpeg",
                                   "image/png"] },
    size: { in: 0..10.megabytes }

  validates_attachment :llc,
    content_type: { content_type: ["application/pdf",
                                   "application/msword",
                                   "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                   "application/vnd.ms-excel",
                                   "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                   "image/jpeg",
                                   "image/png"] },
    size: { in: 0..10.megabytes }

  validates_attachment :tax,
    content_type: { content_type: ["application/pdf",
                                   "application/msword",
                                   "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                   "application/vnd.ms-excel",
                                   "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                   "image/jpeg",
                                   "image/png"] },
    size: { in: 0..10.megabytes }

  validates_attachment :equity_division,
    content_type: { content_type: ["application/pdf",
                                   "application/msword",
                                   "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                   "application/vnd.ms-excel",
                                   "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                   "image/jpeg",
                                   "image/png"] },
    size: { in: 0..10.megabytes }
end
