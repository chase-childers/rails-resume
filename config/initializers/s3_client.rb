require 'aws-sdk-s3'

S3_INFO = {
    :bucket => ENV.fetch("BUCKET_NAME") {"rails-resume"},
    :file => ENV.fetch("RESUME_FILE") {"resume_data.yml"}
}

Rails.logger.info("Started with S3_INFO: #{S3_INFO}")

S3_CLIENT = Aws::S3::Client.new(
    access_key_id: Rails.application.credentials.aws[:access_key_id],
    secret_access_key: Rails.application.credentials.aws[:secret_access_key],
)