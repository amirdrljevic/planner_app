class Department < ApplicationRecord
  validates :department_name, presence: true, length: { minimum: 3 }
end
