
ENV['AWS_BUCKET']='mxmny'
ENV['AWS_ACCESS_KEY_ID'] = "AKIAIX3CI3CXPU45ABFA"
ENV['AWS_SECRET_ACCESS_KEY'] = "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"


ENV['PUBLISHABLE_KEY']='pk_test_85dgBVCarVWNxR6rCOEovf2p'
ENV['SECRET_KEY']='sk_test_CtY58gVmXdha8d24wKMoRZCI'

Paperclip::Attachment.default_options.merge!({
    storage: :s3,
    s3_credentials: {
        access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        bucket: "#{ENV['AWS_BUCKET']}-#{Rails.env}"
        },
    url: ":s3_domain_url",
    path: "/:class/:attachment/:id_partition/:style/:filename"
    })