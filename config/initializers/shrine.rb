require 'shrine/storage/s3'

Shrine.storages[:store] = Shrine::Storage::S3.new(
  access_key_id:     ENV['AWS_ID'],
  secret_access_key: ENV['AWS_SECRET'],
  bucket:            ENV['AWS_S3_BUCKET'],
  region:            'us-east-1'
)
