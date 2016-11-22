class AddMechToIafs < ActiveRecord::Migration[5.0]
  def change
    add_column :iafs, :mech, :boolean
  end
end
