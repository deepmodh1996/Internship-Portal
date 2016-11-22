class VerificationsController < ApplicationController
	def index
		@student = Student.find(params[:student_id])
		@verifications=@student.verifications.all

	end	

	def show

    	@verification = Verification.find(params[:id])
  	end

	def new
		 @student = Student.find(params[:student_id])
		 @verification = @student.verifications.build
	end

  	def create
  		@student = Student.find(params[:student_id])
  		@verification = @student.verifications.build(verification_params)

  	
    if @verification.save
      flash[:success] = "The proof was added!"
      redirect_to student_verification_path(:id =>@verification)
    else
      render 'new'
    end
 	end

 	def destroy
    @verification = Verification.find(params[:id])
    @verification.destroy
 
    redirect_to student_verifications_path
  end

 	 private

 	 def verification_params
    	params.require(:verification).permit(:point, :proof, :mail_id, :student_id)
  	 end
end
