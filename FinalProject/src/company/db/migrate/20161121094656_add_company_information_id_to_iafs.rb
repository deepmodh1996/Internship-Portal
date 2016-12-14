class AddCompanyInformationIdToIafs < ActiveRecord::Migration[5.0]
  def change
    add_column :iafs, :company_information_id, :integer
    add_index :iafs, :company_information_id
  end
end
