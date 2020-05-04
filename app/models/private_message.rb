class PrivateMessage < ApplicationRecord
	belongs_to :sender, class_name: "User"
	has_many :private_message_recipients
	has_many :recipients, class_name: "User", through: :private_message_recipients
end
