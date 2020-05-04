class Gossip < ApplicationRecord
	belongs_to :user
	has_many :gossip_tag_links
	has_many :tags, through: :gossip_tag_links
end
