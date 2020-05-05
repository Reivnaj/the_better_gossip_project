class Gossip < ApplicationRecord
	after_create :success_message

	belongs_to :user
	has_many :gossip_tag_links
	has_many :tags, through: :gossip_tag_links
	
	# Titre obligatoire
	validates :title, presence: true
	# Titre moins de 3 caractères ni plus de 14 caractères
	validates :title, length: { minimum: 3, maximum: 14}
	# Contenu obligatoire
	validates :content, presence: true

	def success_message
		message = "Potin créé ! Bravo et merci"
	end
end
