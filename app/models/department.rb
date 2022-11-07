class Department < ApplicationRecord
  validates :department_name, presence: true, length: { minimum: 3 }

  has_many :users, dependent: :destroy
  #TODO: Check and implement what happens if a user tries to delete a referenced department.
  #TODO: if user deletes department, it shouldn't be available if that department_id is being used in users table
  #a message should pop up
end
