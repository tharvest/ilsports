# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
#Ilbdmt::Application.config.secret_token = '349569b07bc9ace2ff8d399a8cfd4acdcab4d041aed3bd1ba77fc1dc8a6e8f9d48202c73c9b98191202acbb77de1a950eec2ed47f1382d2d181ba778d4091c94'
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		File.read(token_file).chomp
	else
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end
Ilbdmt::Application.config.secret_token = secure_token 
