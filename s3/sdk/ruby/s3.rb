require 'aws-sdk-s3'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']
region = 'ca-central-1'

puts "Bucket: #{bucket_name}"

# Initialize the S3 client
client = Aws::S3::Client.new(
  region: region,
  access_key_id: 'your_access_key_id',
  secret_access_key: 'your_secret_access_key'
)

# Create the bucket (only needed if it doesn't exist)
begin
  client.create_bucket({
    bucket: bucket_name,
    create_bucket_configuration: {
      location_constraint: region
    }
  })
  puts "Bucket '#{bucket_name}' created."
rescue Aws::S3::Errors::BucketAlreadyOwnedByYou
  puts "Bucket '#{bucket_name}' already exists and is owned by you."
end

# Generate a random number of files (between 1 and 6)
number_of_files = 1 + rand(6)
puts "Number of files: #{number_of_files}"

number_of_files.times do |i|
  puts "Uploading file #{i}..."

  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"

  # Write random UUID to a file
  File.open(output_path, 'w') do |f|
    f.write SecureRandom.uuid
  end

  # Upload the file to S3
  File.open(output_path, 'rb') do |f|
    client.put_object(
      bucket: bucket_name,
      key: filename,
      body: f
    )
  end

  puts "Uploaded #{filename} to #{bucket_name}"
end
