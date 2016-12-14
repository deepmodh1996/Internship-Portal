class AddStudentIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :student_id, :integer
    add_index :reviews, :student_id
  end
end
