class AddNatureToCompanyInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :company_informations, :nature, :string
  end
end
