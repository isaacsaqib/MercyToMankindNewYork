class Listing < ActiveRecord::Base
	# has_attached_file :pictures, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	# validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	has_many :pictures
	has_one :default_picture, ->{ reorder(default: :desc) }, class_name: "Picture"
	
end
