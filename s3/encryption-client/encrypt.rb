require "openssl"
require "aws-sdk-s3"
require "pry"
key = OpenSSL::PKey::RSA.new(1024)

# encryption client
s3 = Aws::S3::EncryptionClient.new(encryption_key: key)

# round-trip an object, encryption/decrypted locally
s3.put_object(bucket: "my-bucket", key: "hello.txt", body: "Hello, world!")
resp = s3.get_object(bucket: "my-bucket", key: "hello.txt")

#=> 'handshake'

# Reading encrypted object without the encryption client
# Results in the getting the cipher text
Aws