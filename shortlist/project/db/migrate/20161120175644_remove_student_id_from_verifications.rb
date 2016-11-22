class RemoveStudentIdFromVerifications < ActiveRecord::Migration
  def change
    remove_column :verifications, :student_id, :integer
  end
end
