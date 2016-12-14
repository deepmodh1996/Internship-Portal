class CreateIafs < ActiveRecord::Migration[5.0]
  def change
    create_table :iafs do |t|
      t.string :profile
      t.text :intern_job_description
      t.text :place_of_posting
      t.integer :stipend
      t.date :opens_on
      t.date :closes_on
      t.float :cpi_cutoff
      t.string :departments
      t.timestamps
    end
  end
end
