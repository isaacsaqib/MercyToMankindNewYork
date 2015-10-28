class Picture < ActiveRecord::Base
 has_attached_file :image,
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

  belongs_to :listing

  do_not_validate_attachment_file_type :image

end