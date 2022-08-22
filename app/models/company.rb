class Company < ApplicationRecord
  validates :company_name, presence: true, length: { minimum: 3 }
  validates :country, presence: true, length: { minimum: 3 }
  validates :city, presence: true, length: { minimum: 3 }
end
