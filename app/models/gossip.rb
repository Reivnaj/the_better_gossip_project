class Gossip < ApplicationRecord
	belongs_to :user
	has_many :gossip_tag_links
	has_many :tags, through: :gossip_tag_links
	has_many :comments

	# Titre obligatoire
	validates :title, presence: true
	# Titre moins de 3 caractères ni plus de 14 caractères
	validates :title, length: { minimum: 3, maximum: 14}
	# Contenu obligatoire
	validates :content, presence: true


end
