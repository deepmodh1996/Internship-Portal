class Student < ActiveRecord::Base
#mount_uploader :resume, AttachmentUploader # Tells rails to use this uploader for this model.
   validates :name, presence: true
   validates :roll_no, presence: true
   validates :department, presence: true
   validates :batch, presence: true
   validates :program, presence: true
   validates :category, presence: true
   validates :dob, presence: true
   validates :nationality, presence: true
   validates :sex, presence: true
   validates :gpo_id, presence: true
   validates :alt_email, presence: true
   validates :hostel, presence: true
   validates :mobile, presence: true
   validates :alt_mobile, presence: true
   validates :home_contact, presence: true
   validates :permanent_addr, presence: true
   validates :email, presence: true
   # validates :password_hash, presence: true

  #attr_accessible :email, :password, :password_confirmation
  has_many :verifications#, dependent: :destroy #probably neeed to set primary key as roll no.
  has_many :shortlists
  has_many :reviews
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


has_attached_file :cv
validates_attachment :cv,
                     content_type: { content_type: ['application/pdf']}

end