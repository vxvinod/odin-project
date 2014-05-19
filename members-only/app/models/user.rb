class User < ActiveRecord::Base
	before_create :create_remember_token

	validates :password , presence: :true
	validates :password_confirmation , presence: :true
	has_secure_password

	def self.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def self.digest(token)
		 Digest::SHA1.hexdigest(token.to_s)
	end
	
	private

	def create_remember_token
		self.remember_token = User.digest(User.new_remember_token)
	end


end
