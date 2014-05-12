CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'bookstore-vlad'

  config.aws_acl    = :public_read
  # config.asset_host = 'https://s3-us-west-2.amazonaws.com'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

  config.aws_credentials = {
    access_key_id: 'AKIAIIBBJOK2E4ZW7YAQ',
    secret_access_key: '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'
  }
end