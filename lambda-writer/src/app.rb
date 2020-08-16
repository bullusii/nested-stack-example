# require 'httparty'
require 'json'
require 'aws-sdk-s3'
require 'date'

def lambda_handler(event:, context:)
  # Sample pure Lambda function
  app_name = ENV['APP_NAME']
  bucket = ENV['S3_BUCKET']
  content_version = ENV['VERSION']
  code = 400
  message = 'NONE'

  begin
    s3 = Aws::S3::Resource.new()
    date = DateTime.now().to_s
    filenamePath = date
    puts "Writing files to S3 Bucket #{bucket}"
    obj = s3.bucket(bucket).object(filenamePath)
    content = "#{app_name}#{content_version}"
    obj.put(body: content)
    message = "Success writing #{content} to #{bucket}/#{filenamePath}"
    code = 200
  rescue
    message = "ERROR: Can't write Version #{content_version} to S3 bucket #{bucket}"
    code = 500
  end

  {
    statusCode: code,
    body: {
      message: message
    }.to_json
  }
end
