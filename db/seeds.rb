# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# States data
states = [
  { state_code: 'AL', name: 'Alabama' },
  { state_code: 'AK', name: 'Alaska' },
  { state_code: 'AZ', name: 'Arizona' },
  { state_code: 'AR', name: 'Arkansas' },
  { state_code: 'CA', name: 'California' },
  { state_code: 'CO', name: 'Colorado' },
  { state_code: 'CT', name: 'Connecticut' },
  { state_code: 'DE', name: 'Delaware' },
  { state_code: 'DC', name: 'District of Columbia' },
  { state_code: 'FL', name: 'Florida' },
  { state_code: 'GA', name: 'Georgia' },
  { state_code: 'HI', name: 'Hawaii' },
  { state_code: 'ID', name: 'Idaho' },
  { state_code: 'IL', name: 'Illinois' },
  { state_code: 'IN', name: 'Indiana' },
  { state_code: 'IA', name: 'Iowa' },
  { state_code: 'KS', name: 'Kansas' },
  { state_code: 'KY', name: 'Kentucky' },
  { state_code: 'LA', name: 'Louisiana' },
  { state_code: 'ME', name: 'Maine' },
  { state_code: 'MD', name: 'Maryland' },
  { state_code: 'MA', name: 'Massachusetts' },
  { state_code: 'MI', name: 'Michigan' },
  { state_code: 'MN', name: 'Minnesota' },
  { state_code: 'MS', name: 'Mississippi' },
  { state_code: 'MO', name: 'Missouri' },
  { state_code: 'MT', name: 'Montana' },
  { state_code: 'NE', name: 'Nebraska' },
  { state_code: 'NV', name: 'Nevada' },
  { state_code: 'NH', name: 'New Hampshire' },
  { state_code: 'NJ', name: 'New Jersey' },
  { state_code: 'NM', name: 'New Mexico' },
  { state_code: 'NY', name: 'New York' },
  { state_code: 'NC', name: 'North Carolina' },
  { state_code: 'ND', name: 'North Dakota' },
  { state_code: 'OH', name: 'Ohio' },
  { state_code: 'OK', name: 'Oklahoma' },
  { state_code: 'OR', name: 'Oregon' },
  { state_code: 'PA', name: 'Pennsylvania' },
  { state_code: 'RI', name: 'Rhode Island' },
  { state_code: 'SC', name: 'South Carolina' },
  { state_code: 'SD', name: 'South Dakota' },
  { state_code: 'TN', name: 'Tennessee' },
  { state_code: 'TX', name: 'Texas' },
  { state_code: 'UT', name: 'Utah' },
  { state_code: 'VT', name: 'Vermont' },
  { state_code: 'VA', name: 'Virginia' },
  { state_code: 'WA', name: 'Washington' },
  { state_code: 'WV', name: 'West Virginia' },
  { state_code: 'WI', name: 'Wisconsin' },
  { state_code: 'WY', name: 'Wyoming' }
]

states.each do |data|
  state = State.find_or_initialize_by(state_code: data[:state_code])
  state.name = data[:name]
  state.save!
end

# Listing types
types = [
  {type: 'buy'},
  {type: 'sell'}
]

(0..1).each do |i|
  type = Type.find_or_initialize_by(id:i)
  type.type = types[i][:type]
  type.save!
end