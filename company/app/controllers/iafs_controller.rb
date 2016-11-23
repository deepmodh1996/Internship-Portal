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

	def select_student
	    num = JSON.parse ActiveRecord::Base.connection.execute("SELECT count(*) FROM shortlists where (iaf_id = "+params[:iaf]+" and student_id  = "+params[:student]+" and status = 0);").to_json;
	     # = num;
	    if (num[0][0] == 1)
	      ActiveRecord::Base.connection.execute("UPDATE shortlists SET status = 1 WHERE (iaf_id = "+params[:iaf]+" and student_id  = "+params[:student]+");");
	    end
		redirect_to shortlist_path(:id => params[:iaf])
	end

  	def unselect_student
	    num = JSON.parse ActiveRecord::Base.connection.execute("SELECT count(*) FROM shortlists where (iaf_id = "+params[:iaf]+" and student_id  = "+params[:student]+" and status = 1);").to_json;
	    if (num[0][0] == 1)
	      ActiveRecord::Base.connection.execute("UPDATE shortlists SET status = 0 WHERE (iaf_id = "+params[:iaf]+" and student_id  = "+params[:student]+");");
	    end
		redirect_to shortlist_path(:id => params[:iaf])
	end
	
	def freeze_shortlist
		ActiveRecord::Base.connection.execute("UPDATE iafs SET status = 2 WHERE (id = "+params[:iaf]+");");

		ActiveRecord::Base.connection.execute("DELETE FROM shortlists WHERE (iaf_id = "+params[:iaf]+" and status = 0);");
		ActiveRecord::Base.connection.execute("UPDATE shortlists SET status = 2 WHERE (iaf_id = "+params[:iaf]+" and status = 1);");

		ActiveRecord::Base.connection.execute("CREATE TABLE tempTable (iaf_id int, student_id int, status int);");
		ActiveRecord::Base.connection.execute("INSERT INTO tempTable (SELECT iaf_id, student_id, status FROM shortlists);");
		ActiveRecord::Base.connection.execute("delete from shortlists where exists (select * from tempTable where tempTable.status=2 and shortlists.student_id=tempTable.student_id and (not shortlists.status = 2));");
		ActiveRecord::Base.connection.execute("DROP TABLE tempTable;");

		redirect_to shortlist_path(:id => params[:iaf])
	end

	def show
		@company_information = CompanyInformation.find(params[:company_information_id])
		@iaf = @company_information.iafs.find(params[:id])
	end
	def shortlist
		@list = ActiveRecord::Base.connection.execute("SELECT * FROM shortlists, students WHERE (iaf_id = "+params[:id]+") AND (shortlists.student_id = students.id);");
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
