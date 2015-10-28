class Picture < ActiveRecord::Base
 has_attached_file :image,
    storage: :s3,
    s3_credentials: {
    	access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        bucket: "#{ENV['AWS_BUCKET']}-#{Rails.env}"
        },
    url: ":s3_domain_url",
    path: "/:class/:attachment/:id_partition/:style/:filename"
    })

  belongs_to :listing

  do_not_validate_attachment_file_type :image

end