module ApplicationHelper
  include Pagy::Frontend
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

  #Pass image url to image_tag
  def user_image_tag(user)
    user.image.attached? ? user.display_image : "default_user_image.png" 
  end
end
