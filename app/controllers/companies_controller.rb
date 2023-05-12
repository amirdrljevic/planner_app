class CompaniesController < ApplicationController
  before_action :logged_in_user
  before_action :set_company, only: %i[ show edit update destroy ]
  

  # GET /companies or /companies.json
  def index
    @q = Company.ransack(params[:q])
    set_default_sort
    scope = @q.result(distinct: true)

    @pagy, @companies = pagy(scope, items: 10)
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)
    if @company.save
      @companies = Company.all
      respond_to do |format|
        format.html { redirect_to companies_path, notice: "Company was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Company was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    if @company.update(company_params)
      respond_to do |format|
        format.html { redirect_to companies_path, notice: "Company was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Company was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end
  

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company_destroyed = false
    begin
      @company.destroy
      @company_destroyed = true
      respond_to do |format|
        format.html { redirect_to companies_path, notice: "Company was successfully destroyed." }
        format.turbo_stream { flash.now[:notice] = "Company was successfully destroyed." }
      end
    rescue ActiveRecord::InvalidForeignKey => e
      respond_to do |format|
        format.html { redirect_to companies_path, notice: "You cannot delete this company because it is used elsewhere." }
        format.turbo_stream { flash.now[:notice] = "You cannot delete this company because it is used elsewhere." }
      end
    end
  end


  private
    def set_default_sort
      @q.sorts = "id desc" if @q.sorts.empty?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:company_name, :street_address, :postal_code, :city, :country)
    end
end
