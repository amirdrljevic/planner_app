class Meeting < ApplicationRecord
  enum status: { open: 'open', closed: 'closed', postponed: 'postponed', 'n/a': 'n/a' }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images
end
