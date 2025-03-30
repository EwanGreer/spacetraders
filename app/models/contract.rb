class Contract < ApplicationRecord
  has_many :deliverables, dependent: :destroy
  serialize :terms, JSON
end
