class ApplicationController < ActionController::Base
  include Pagy::Backend
  #before_action -> { sleep 3 }
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :set_status

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
                                                        :private_phone,
                                                        :email,
                                                        :password,
                                                        :password_confirmation])
    end

  private

    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end

    def set_status
      current_user.update!(status: User.statuses[:online]) if current_user
    end
  

    # Check if user is logged in
    def logged_in_user
      unless user_signed_in?
        respond_to do |format|
          format.html { redirect_to new_user_session_path, notice: "Restricted access. Please sign in." }
          format.json { head :no_content }      
        end
      end
    end
end
