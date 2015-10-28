class Listing < ActiveRecord::Base
	has_attached_file :pictures,
	:storage => :s3,
  	:s3_credentials => {
    :bucket => ENV['AZ_BUCKET'],
    :access_key_id => ENV['AZ_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AZ_SECRET_ACCESS_KEY']
  }

  	# validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	has_many :pictures, :dependent => :destroy

end
