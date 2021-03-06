require 'digest/sha2'

class User < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true
	
	validates :password, :confirmation => true
	attr_accessor :password_confirmation
	attr_reader   :password
	
	validate  :password_must_be_present
	
	class << self
		def encrypt_password(password,salt)
			Digest::SHA2.hexdigest(password + "wibble" + salt)
		end
		
		def authenticate(name, password)
			if user = find_by_name(name)
				if user.hashed_password == encrypt_password(password, user.salt)
					user
				end
			end
		end
	end
	
	def password=(password)
		@password = password
	
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
		end
	end
	
	def remember_me
		self.remember_token = self.hashed_password
		self.remember_token_expires = 2.weeks.from_now
		self.update_attribute(:remember_token, self.remember_token)
	end
	
	def forget_me
		self.remember_token = nil
		self.remember_token_expires = nil
	    self.update_attribute(:remember_token, self.remember_token)
	end

	
private
	def password_must_be_present
		errors.add(:password, "Missing password") unless hashed_password.present?
	end
	
	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	end
	
	
end
