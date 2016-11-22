class AddVerifiedToStudents < ActiveRecord::Migration
  def change
    add_column :students, :verified, :boolean, default: false
  end
end
