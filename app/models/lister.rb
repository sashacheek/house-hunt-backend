class Lister < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token
  validates :email, presence: true, uniqueness: true
  normalizes :email, with: ->(e) { e.strip.downcase }
  has_many :listings, foreign_key: 'lister_id', primary_key: 'id'
end
