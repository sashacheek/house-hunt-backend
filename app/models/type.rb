class Type < ApplicationRecord
    has_one :listings, foreign_key: 'type_id', primary_key: 'id'
end
