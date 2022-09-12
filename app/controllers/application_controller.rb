class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, 
                                                       :last_name, 
                                                       :role_id, 
                                                       :department_id, 
                                                       :company_id, 
                                                       :date_of_birth, 
                                                       :position, 
                                                       :office_phone, 
                                                       :mobile_phone, 
                                                       :private_phone])
  end
end
