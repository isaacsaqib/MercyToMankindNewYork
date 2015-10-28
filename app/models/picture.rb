class Picture < ActiveRecord::Base
  has_attached_file :image,
  :storage => :s3,
  :s3_credentials => {
    :bucket => ENV['AWS_BUCKET'],
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  },
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

  belongs_to :listing

  do_not_validate_attachment_file_type :image

end