class Listing < ApplicationRecord
  belongs_to :lister, optional: true
  belongs_to :address
  belongs_to :type, optional: true
  has_many :pictures, foreign_key: 'listing_id'
end
