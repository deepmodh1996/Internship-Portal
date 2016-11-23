class AddStatusToIafs < ActiveRecord::Migration[5.0]
  def change
    add_column :iafs, :status, :integer, default: 1
  end
end
