class Gossip < ApplicationRecord
	belongs_to :user
	has_many :gossip_tag_links
	has_many :tags, through: :gossip_tag_links

	def self.get_all
		# Cette méthode récupère tous les gossips (titre et auteur)
		Gossip.all
	end
end
