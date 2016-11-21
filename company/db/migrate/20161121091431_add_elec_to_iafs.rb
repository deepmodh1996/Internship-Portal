class AddElecToIafs < ActiveRecord::Migration[5.0]
  def change
    add_column :iafs, :elec, :bool
  end
end
