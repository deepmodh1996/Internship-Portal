class Iaf < ApplicationRecord
	belongs_to :company_information
	has_many :shortlists
	validates :profile, presence:true
	validates :intern_job_description, presence: true
	validates :stipend, presence: true
	validates :opens_on, presence: true
	validates :closes_on, presence: true
	validates :departments, presence: true
	validates :place_of_posting, presence: true
end
