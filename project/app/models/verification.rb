class Verification < ActiveRecord::Base
	belongs_to :student
	has_attached_file :proof
	validates_attachment :proof,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end
