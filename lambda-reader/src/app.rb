# require 'httparty'
require 'json'
require 'aws-sdk-s3'
require 'date'

def lambda_handler(event:, context:)
  # Sample pure Lambda function
  app_name = ENV['APP_NAME']
  bucket = ENV['S3_BUCKET']
  content = "NONE"
  code = 400

  #begin
    s3 = Aws::S3::Resource.new()
    puts "Reading files to S3 Bucket #{bucket}"
    latest_obj = 'none'
    s3.bucket(bucket).objects.each do |obj|
      latest_obj = obj.key
    end
    puts latest_obj
    content = "SUCCESSFULLY READ: #{s3.bucket(bucket).object(latest_obj).get.body.read}"
    code = 200
  #rescue
  #  content = "ERROR: Can't read from S3 Bucket #{bucket}"
  #  code = 500
  #end

  {
    statusCode: code,
    body: {
      message: content
    }.to_json
  }
end
