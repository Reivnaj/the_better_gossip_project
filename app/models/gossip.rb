class Gossip < ApplicationRecord
	belongs_to :user
	has_many :gossip_tag_links
	has_many :tags, through: :gossip_tag_links
	has_many :comments
	has_many :likes

	# Titre obligatoire
	validates :title, presence: true
	# Titre moins de 3 caractères ni plus de 14 caractères
	validates :title, length: { minimum: 3, maximum: 14}
	# Contenu obligatoire
	validates :content, presence: true

	def is_liked?(user)
		# Vérifier si le potin est liké par le current_user
		# Vérifier si dans la table des likes, on a une entrée qui correspond à ce gossip et au current_user
		!likes.find_by(user: user).nil?
	end


end
