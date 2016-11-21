class IafsController < ApplicationController

	def index
		@company_information = CompanyInformation.find(params[:company_information_id])
		@iaf = @company_information.iafs.all
	end
	def new
		@company_information = CompanyInformation.find(params[:company_information_id])
		@iaf = @company_information.iafs.build
	end

	def create
		@company_information = CompanyInformation.find(params[:company_information_id])
		@iaf = @company_information.iafs.build(iaf_params)
		if @iaf.save
		redirect_to company_information_iaf_path(:id => @iaf)
		else
			render 'new'
		end
	end
	
	def show
		@company_information = CompanyInformation.find(params[:company_information_id])
		@iaf = @company_information.iafs.find(params[:id])
	end
	def edit
		@company_information = CompanyInformation.find(params[:company_information_id])
		@iaf = @company_information.iafs.find(params[:id])
	end
	def update
		@iaf = Iaf.find(params[:id])
		if @iaf.update(iaf_params)
			redirect_to company_information_iaf_path(:id => @iaf)
		else
			render 'edit'
		end

	end
	def destroy
  		@iaf = Iaf.find(params[:id])
  		@iaf.destroy
 
  		redirect_to company_information_iafs_path
	end
	private
		def iaf_params
			params.require(:iaf).permit(:profile, :intern_job_description, :place_of_posting, :stipend, :opens_on, :closes_on, :cpi_cutoff, :departments, :cse, :elec, :mech, :meta)
		end
	
end
