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

  # GET /companies/1 or /companies/1.json
  def show
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

    respond_to do |format|
      if @company.save
        format.html { redirect_to company_url(@company), notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    begin
      @company.destroy
      respond_to do |format|
        format.html { redirect_to companies_path, notice: "Company was successfully destroyed." }
        format.turbo_stream { flash.now[:notice] = "Company was successfully destroyed." }
      end
    rescue ActiveRecord::InvalidForeignKey => e
      respond_to do |format|
        format.html { redirect_to companiess_path, notice: "You cannot delete this company because it is used elsewhere." }
        format.turbo_stream { flash.now[:notice] = "You cannot delete this company because it is used elsewhere." }
      end
    end
  end

  private
    def set_default_sort
      @q.sorts = "name asc" if @q.sorts.empty?
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
