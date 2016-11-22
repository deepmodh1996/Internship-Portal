class AddAttachmentCvToStudents < ActiveRecord::Migration
  def self.up
    change_table :students do |t|
      t.attachment :cv
    end
  end

  def self.down
    remove_attachment :students, :cv
  end
end
