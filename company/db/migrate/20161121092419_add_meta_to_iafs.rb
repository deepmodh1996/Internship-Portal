class AddMetaToIafs < ActiveRecord::Migration[5.0]
  def change
    add_column :iafs, :meta, :bool
  end
end
