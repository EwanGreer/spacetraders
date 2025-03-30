class Contract < ApplicationRecord
  belongs_to :agent
  has_many :deliverables, dependent: :destroy
  # serialize :terms, JSON
end
