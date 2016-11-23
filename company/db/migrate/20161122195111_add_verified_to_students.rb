class AddVerifiedToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :verified, :boolean, default: false
  end
end
