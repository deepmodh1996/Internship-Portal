class AddStudentIdToVerifications < ActiveRecord::Migration
  def change
    add_column :verifications, :student_id, :integer
    add_index :verifications, :student_id
  end
end
