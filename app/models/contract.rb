class Contract < ApplicationRecord
  belongs_to :agent
  has_one :payment
  has_one :delivery
end
