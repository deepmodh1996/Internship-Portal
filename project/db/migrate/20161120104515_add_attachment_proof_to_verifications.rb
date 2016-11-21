class AddAttachmentProofToVerifications < ActiveRecord::Migration
  def self.up
    change_table :verifications do |t|
      t.attachment :proof
    end
  end

  def self.down
    remove_attachment :verifications, :proof
  end
end
