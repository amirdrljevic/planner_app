class HomeController < ApplicationController
  before_action :logged_in_user 
  
  def index
  end

  private
    def logged_in_user
      unless user_signed_in?
        respond_to do |format|
          format.html { redirect_to new_user_session_path, notice: "ADIN" }
          format.json { head :no_content }      
        end
      end    
    end     
end
