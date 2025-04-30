class State < ApplicationRecord
  self.primary_key = 'state_code'
  has_many :addresses, foreign_key: 'state_code'
end
