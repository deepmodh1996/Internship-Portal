class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
      t.integer :student_id
      t.string :point
      t.string :mail_id

      t.timestamps
    end
  end
end
