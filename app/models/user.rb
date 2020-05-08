class User < ApplicationRecord
	belongs_to :city
	has_many :gossips
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
	has_many :private_message_recipients, foreign_key: 'recipient_id'
	has_many :received_messages, through: :private_message_recipients, source: :private_message
	has_many :comments
	has_many :likes

	has_secure_password
  validates :password, presence: true, length: {minimum: 6}
	# Prénom obligatoire
	validates :first_name, presence: true
	# Nom obligatoire
	validates :last_name, presence: true
	# Description obligatoire
	validates :description, presence: true
	# Email est obligatoire, doit être unique et avoir un format d'email
	validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
	# Format de l'age
	validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end

end
