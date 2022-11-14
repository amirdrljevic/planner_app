class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_update_commit {broadcast_update}


  has_one_attached :image

  belongs_to :department
  belongs_to :role
  belongs_to :company   
  has_many :meetings
  has_many :comments

  enum status: %i[offline away do_not_disturb online]

  validates :first_name, presence: true, length: { minimum: 3 }
  validates :last_name, presence: true, length: { minimum: 3 }
  validates :position, presence: true, length: { minimum: 3 }
  validates :date_of_birth, presence: true

  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                                      size:         { less_than: 1.megabytes,
                                                      message:   "should be less than 1MB" }
 def display_image
       image.variant(resize_to_limit: [1000, 1000])
 end

 def broadcast_update
      broadcast_replace_to 'user_status', partial: 'users/status', user: self
 end
 
 def status_to_css
      case status
      when 'online'
        'bg-success'
      when 'away'
        'bg-warning'
      when 'do_not_disturb'
        'bg-danger'
      when 'offline'
        'bg-secondary'
      else
        'bg-secondary'
      end
 end

end
