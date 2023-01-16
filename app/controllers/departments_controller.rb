class DepartmentsController < ApplicationController
  before_action :logged_in_user
  before_action :set_department, only: %i[ show edit update destroy ]

  # GET /departments or /departments.json
  def index
    @departments = Department.ordered
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments or /departments.json
  def create
    @department = Department.new(department_params)

    if @department.save
      respond_to do |format|
        format.html { redirect_to departments_path, notice: "Department was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /departments/1 or /departments/1.json
  def update
    if @department.update(department_params)
      respond_to do |format|
        format.html { redirect_to departments_path, notice: "Department was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Department was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /departments/1 or /departments/1.json
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Quote was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def department_params
      params.require(:department).permit(:department_name)
    end
end
