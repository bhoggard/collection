class ImageUploader < Shrine
  plugin :activerecord
  plugin :determine_mime_type
  plugin :direct_upload, presign: true
end
