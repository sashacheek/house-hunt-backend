class Address < ApplicationRecord
  belongs_to :states, foreign_key: 'state_code'
  has_one :listings, foreign_key: 'address_id', primary_key: 'id'
end
