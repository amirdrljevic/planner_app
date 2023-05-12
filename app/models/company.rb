class Company < ApplicationRecord
  validates :company_name, presence: true, length: { minimum: 3 }
  validates :country, presence: true, length: { minimum: 3 }
  validates :city, presence: true, length: { minimum: 3 }


  validates :postal_code, numericality: true

  has_many :users
  # TODO: if user deletes a company, it shouldn't be available if that company_id is being used in users table
  # a message should pop up

  broadcasts_to ->(company) { "companies" }, inserts_by: :prepend
end
