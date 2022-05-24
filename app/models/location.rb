class Location < ApplicationRecord
  belongs_to :client, inverse_of: :locations
  has_many :jobs, inverse_of: :location, dependent: :destroy
end
