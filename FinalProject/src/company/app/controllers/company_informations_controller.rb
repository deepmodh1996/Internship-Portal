class CompanyInformationsController < ApplicationController
  before_action :set_company_information, only: [:show, :edit, :update, :destroy]

  # GET /company_informations
  # GET /company_informations.json
  def index
    @company_informations = CompanyInformation.all
  end

  # GET /company_informations/1
  # GET /company_informations/1.json
  def show
  end

  # GET /company_informations/new
  def new
    @company_information = CompanyInformation.new
  end

  # GET /company_informations/1/edit
  def edit
  end

  # POST /company_informations
  # POST /company_informations.json
  def create
    @company_information = CompanyInformation.new(company_information_params)

    respond_to do |format|
      if @company_information.save
        format.html { redirect_to @company_information, notice: 'Company information was successfully created.' }
        format.json { render :show, status: :created, location: @company_information }
      else
        format.html { render :new }
        format.json { render json: @company_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_informations/1
  # PATCH/PUT /company_informations/1.json
  def update
    respond_to do |format|
      if @company_information.update(company_information_params)
        format.html { redirect_to @company_information, notice: 'Company information was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_information }
      else
        format.html { render :edit }
        format.json { render json: @company_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_informations/1
  # DELETE /company_informations/1.json
  def destroy
    @company_information.destroy
    respond_to do |format|
      format.html { redirect_to company_informations_url, notice: 'Company information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_information
      @company_information = CompanyInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_information_params
      params.require(:company_information).permit(:name, :address_line1, :address_line2, :city, :country, :pin, :url, :contact_person, :designation, :email, :contact_number, :cell_number, :nature)
    end
end
