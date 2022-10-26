module ApplicationHelper

  #Pass image url to image_tag
  def user_image_tag(user)
    user.image.attached? ? user.display_image : "default_user_image.png" 
  end
end
