class AddCseToIafs < ActiveRecord::Migration[5.0]
  def change
    add_column :iafs, :cse, :bool
  end
end
