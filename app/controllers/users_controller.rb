class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :set_user, only: %i[ show edit update destroy ]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end
  # TODO: Only admins can see every user (index and show), others can't
  def edit
  end

  # PATCH/PUT /users_admin/1 or /users_admin/1.json
  def update
     respond_to do |format|
     update_params =  params[:user][:password].present? ? user_params_with_password  : user_params

      if @user.update(update_params)
        format.html { redirect_to users_admin_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end  

  # POST /users or /users.json
  def create
    @user = User.new(user_params_with_password)
    @user.image.attach(params[:user][:image])

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_admin_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end  

    #Only allow a list of trusted parameters through.
    def user_params_with_password
         
      params.require(:user).permit(:first_name, 
                                   :last_name, 
                                   :email, 
                                   :date_of_birth, 
                                   :company_id, 
                                   :role_id, 
                                   :department_id, 
                                   :position, 
                                   :password,
                                   :password_confirmation,
                                   :image,
                                   :office_phone,
                                   :mobile_phone,
                                   :private_phone)      
    end    
    
    def user_params         
      params.require(:user).permit(:first_name, 
                                   :last_name, 
                                   :email, 
                                   :date_of_birth, 
                                   :company_id, 
                                   :role_id, 
                                   :department_id, 
                                   :position, 
                                   :image,
                                   :office_phone,
                                   :mobile_phone,
                                   :private_phone)      
    end 
end
