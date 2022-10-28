class Meeting < ApplicationRecord
  enum status: { open: 'open', closed: 'closed', postponed: 'postponed', 'n/a': 'n/a' }
  belongs_to :user
end
