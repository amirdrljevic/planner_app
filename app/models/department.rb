class Department < ApplicationRecord
  validates :department_name, presence: true, length: { minimum: 3 }
  scope :ordered, -> { order(id: :desc) }

  has_many :users
  #TODO: Check and implement what happens if a user tries to delete a referenced department.
  #TODO: if user deletes department, it shouldn't be available if that department_id is being used in users table
  #a message should pop up

  broadcasts_to ->(department) { "departments" }, inserts_by: :prepend
end