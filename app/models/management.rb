class Management < ApplicationRecord
  belongs_to :user
  has_one :street_address
end
