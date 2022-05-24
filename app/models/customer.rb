class Customer < ApplicationRecord
  belongs_to :client, inverse_of: :customers
  has_many :jobs, inverse_of: :customer, dependent: :destroy
end
