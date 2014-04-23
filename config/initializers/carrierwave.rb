CarrierWave.configure do |config|

  # config.s3_access_key_id = 'AKIAIIBBJOK2E4ZW7YAQ'
  # config.s3_secret_access_key = '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'
  # config.s3_bucket = 'bookstore-vlad'

  # config.cache_dir = "#{Rails.root}/tmp/uploads"

  # config.root = Rails.root.join('tmp') # adding these...
  # config.cache_dir = 'carrierwave' # ...two lines

  # config.fog_credentials = {
  #   :provider               => 'AWS',                        # required
  #   :aws_access_key_id      => 'AKIAIIBBJOK2E4ZW7YAQ',       # required
  #   :aws_secret_access_key  => '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',  # required
  #   :region                 => 'Oregon',                     # optional, defaults to 'us-east-1'
  #   :host                   => 'hidden-fortress-5047.herokuapp.com',       # optional, defaults to nil
  #   :endpoint               => 'http://hidden-fortress-5047.herokuapp.com' # optional, defaults to nil
  # }
  # config.fog_directory  = 'bookstore-vlad'                     # required
  # config.fog_public     = false                                   # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end