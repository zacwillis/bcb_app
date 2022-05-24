class Job < ApplicationRecord
  belongs_to :client, inverse_of: :jobs
  belongs_to :customer, inverse_of: :jobs
end
