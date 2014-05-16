require 'encryptor'
module RPass
  class Encryption
    Encryptor.default_options.merge!(:key => 'some default secret key')
    puts "hai".encrypt
  end
end
