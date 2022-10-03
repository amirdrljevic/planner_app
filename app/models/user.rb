class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image

  belongs_to :department
  belongs_to :role
  belongs_to :company      

  validates :first_name, presence: true, length: { minimum: 3 }
  validates :last_name, presence: true, length: { minimum: 3 }
  validates :position, presence: true, length: { minimum: 3 }
  validates :date_of_birth, presence: true

  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                                      size:         { less_than: 1.megabytes,
                                                      message:   "should be less than 1MB" }
end
