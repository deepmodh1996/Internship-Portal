class RemoveTypeFromCompanyInformations < ActiveRecord::Migration[5.0]
  def change
    remove_column :company_informations, :type, :string
  end
end
