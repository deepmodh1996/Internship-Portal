class CreateCompanyInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :company_informations do |t|
      t.string :name
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :country
      t.string :pin
      t.string :url
      t.string :contact_person
      t.string :designation
      t.string :email
      t.string :contact_number
      t.string :cell_number
      t.string :type

      t.timestamps
    end
  end
end
