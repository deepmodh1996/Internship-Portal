class ReviewsController < ApplicationController
	def index
		@student = Student.find(params[:student_id])
		@reviews=Review.all
	end	

	def show
    	@review = review.find(params[:id])
  	end

	def new
		 @student = Student.find(params[:student_id])
		 @review = @student.reviews.build
	end

  	def create
  		@student = Student.find(params[:student_id])
  		@review = @student.reviews.build(review_params)

  	
    if @review.save
      flash[:success] = "The review was added!"
      redirect_to student_reviews_path
    else
      render 'new'
    end
 	end

 	def destroy
    @review = Review.find(params[:id])
    @review.destroy
 
    redirect_to student_reviews_path
  end

 	 private

 	 def review_params
    	params.require(:review).permit(:organization, :review, :student_id)
  	 end
end
