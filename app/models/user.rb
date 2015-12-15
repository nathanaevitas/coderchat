class User < ActiveRecord::Base
	has_many :friendships
	has_many :friends, through: :friendships
	has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
	has_many :recieved_messages, :class_name => 'Message', :foreign_key => 'recipient_id'
	has_secure_password
end
