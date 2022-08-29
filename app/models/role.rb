class Role < ApplicationRecord
  validates :role_name, presence: true, length: { minimum: 3 }
  has_many :users
  # TODO: if user deletes a role, it shouldn't be available if that role_id is being used in users table
  # a message should pop up
end
