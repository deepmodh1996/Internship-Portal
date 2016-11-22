class AddEmailPasswordHashPasswordSaltToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :email, :string
    add_column :students, :password_hash, :string
    add_column :students, :password_salt, :string
  end
end
