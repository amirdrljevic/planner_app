class Company < ApplicationRecord
  validates :company_name, presence: true, length: { minimum: 3 }
  validates :country, presence: true, length: { minimum: 3 }
  validates :city, presence: true, length: { minimum: 3 }


  validates :postal_code, numericality: true
  #validates :postal_code, numericality: { only_integer: true }

end
