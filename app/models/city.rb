class City < ApplicationRecord
	has_many :users
	has_many :gossips, through: :users 
	# Nom obligatoire
	validates :name, presence: true
	# Zip code unique et au format français
	validates :zip_code,
		presence: true,
		uniqueness: true,
		format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "please enter a valid french zip code"}
end
