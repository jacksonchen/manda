class Employer < ApplicationRecord
  belongs_to :employable, polymorphic: true, optional: true
end
