class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
  	@student = Student.new
  end

  def edit
  @student = Student.find(params[:id])
end

  def create
  @student = Student.new(student_params)
 
	 if @student.save
    	redirect_to @student, :notice => "Signed up!"
 	 else
    	render 'new'
  	end
  end

  def update
  @student = Student.find(params[:id])
 
  if @student.update(student_params)
    redirect_to @student
  else
    render 'edit'
  end
end

def destroy
    @student = Student.find(params[:id])
    @student.destroy
 
    redirect_to students_path
  end

  def verify
  @student = Student.find(params[:id])
  end

 def upload
 	@student = Student.find(params[:id])

 end


  
 
private
  def student_params
    params.require(:student).permit(:name, :roll_no, :department, :batch, :program, :category, :dob, :nationality, :sex, :gpo_id, :alt_email, :hostel, :mobile, :alt_mobile, :home_contact, :permanent_addr, :specialization, :skype, :cv, :email, :password, :password_confirmation, :verified)
  end
end
