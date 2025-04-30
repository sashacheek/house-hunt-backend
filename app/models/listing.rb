class Listing < ApplicationRecord
  belongs_to :lister
  belongs_to :address
  belongs_to :type
  has_many: :pictures, :foreign_key: :listing_id, :primary_key: :id
end
