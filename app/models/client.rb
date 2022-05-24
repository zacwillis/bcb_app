class Client < ApplicationRecord
  has_many :locations, inverse_of: :client, dependent: :destroy
  has_many :jobs, inverse_of: :client, dependent: :destroy
  has_many :vehicles, inverse_of: :client, dependent: :destroy
  has_many :customers, inverse_of: :client, dependent: :destroy
end
