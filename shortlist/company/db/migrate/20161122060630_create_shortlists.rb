class CreateShortlists < ActiveRecord::Migration[5.0]
  def change
    create_table :shortlists do |t|
    	t.integer :iaf_id
    	t.integer :student_id
    	t.integer :status
      t.timestamps
    end
  end
end
