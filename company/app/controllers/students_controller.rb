class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show_student_iaf
    @iaf = Iaf.find(params[:iaf]);
  end

  def sign_iaf
    num = JSON.parse ActiveRecord::Base.connection.execute("SELECT count(*) FROM shortlists where (iaf_id = "+params[:iaf]+" and student_id  = "+params[:student]+");").to_json;
     # = num;
    if (num[0][0] == 0)
      ActiveRecord::Base.connection.execute("INSERT INTO shortlists (iaf_id,student_id,status,created_at,updated_at) values ("+params[:iaf]+","+params[:student]+",0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);");
    end
    redirect_to student_path(params[:student]);
  end

  def unsign_iaf
    num = JSON.parse ActiveRecord::Base.connection.execute("SELECT count(*) FROM shortlists where (iaf_id = "+params[:iaf]+" and student_id  = "+params[:student]+");").to_json;
    if (num[0][0] > 0)
      ActiveRecord::Base.connection.execute("DELETE FROM shortlists WHERE iaf_id = "+params[:iaf]+" and student_id = "+params[:student]+";");
    end
      redirect_to student_path(params[:student]);
  end

  def show
    @student = Student.find(params[:id])
    @iafs = Iaf.all
    # @iafs.each do |iaf|
    #   iaf[:id],params[:id]
    # end
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

 def upload
 	@student = Student.find(params[:id])
 	#  if @student.save
  #   redirect_to @student
  # else
  #   render 'new'
  # end

end
  
 
private
  def student_params
    params.require(:student).permit(:name, :roll_no, :department, :batch, :program, :category, :dob, :nationality, :sex, :gpo_id, :alt_email, :hostel, :mobile, :alt_mobile, :home_contact, :permanent_addr, :specialization, :skype, :cv, :email, :password, :password_confirmation)
  end
end

