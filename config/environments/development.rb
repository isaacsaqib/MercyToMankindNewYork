Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
# AWS Keys

config.paperclip_defaults = {
  :storage => :s3,
  :s3_credentials => {
    :bucket => 'mymny',
    :access_key_id => 'AKIAIX6IOZ3F5647G7MQ',
    :secret_access_key => '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'
  }
}

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :authentication => :plain,
  :address => "smtp.mailgun.org",
  :port => 587,
  :domain => "mg.mercyxmankind.mailgun.org",
  :user_name => "postmaster@mg.mercyxmankind.mailgun.org",
  :password => "canarsie0988"
}

#  config.paperclip_defaults = {
#   :storage => :s3,
#   :s3_region => 'us-east-1',
#     :s3_credentials => {
#       :bucket => 'azstore',
#       :access_key_id => 'AKIAJ7ORJEY33V2EDTJQ',
#       :secret_access_key => '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',
#     },
#    :url =>':s3_domain_url',
#     :path => '/:class/:attachment/:id_partition/:style/:filename'
# }


# Stripe Test Keys 

ENV['PUBLISHABLE_KEY']='pk_test_85dgBVCarVWNxR6rCOEovf2p'
ENV['SECRET_KEY']='sk_test_CtY58gVmXdha8d24wKMoRZCI'

# Live

# ENV['PUBLISHABLE_KEY']='pk_live_qQtQHJtmcR1SI16gQlcAStly'
# ENV['SECRET_KEY']='sk_live_Zo6Tcaeyh7EADgohnxy58TqE'



  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load
  
  config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  
config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  Paperclip.options[:command_path] = "/usr/local/bin/"

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end