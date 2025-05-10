class Listing < ApplicationRecord
  belongs_to :lister
  belongs_to :address, dependent: :destroy
  belongs_to :type
  has_many :pictures, foreign_key: 'listing_id', dependent: :destroy
end
