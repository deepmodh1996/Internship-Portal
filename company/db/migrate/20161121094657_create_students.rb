class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :roll_no
      t.string :department
      t.string :batch
      t.string :program
      t.string :category
      t.date :dob
      t.string :nationality
      t.string :sex
      t.string :gpo_id
      t.string :alt_email
      t.text :hostel
      t.string :mobile
      t.string :alt_mobile
      t.string :home_contact
      t.text :permanent_addr
      t.string :specialization
      t.string :skype

      t.timestamps
    end
  end
end
