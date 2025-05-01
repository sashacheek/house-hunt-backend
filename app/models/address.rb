class Address < ApplicationRecord
  belongs_to :state, foreign_key: 'state_code', primary_key: 'state_code'
  has_one :listing, foreign_key: 'address_id', primary_key: 'id'
end
