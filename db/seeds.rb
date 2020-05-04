# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Sets the locale to "France":
Faker::Config.locale = 'fr'

# Détruire la base actuelle
City.destroy_all
Gossip.destroy_all
GossipTagLink.destroy_all
PrivateMessage.destroy_all
Tag.destroy_all
User.destroy_all
PrivateMessageRecipient.destroy_all

# Remettre les compteurs à 0
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

# Création de 10 villes et de 10 utilisateurs associés
10.times do
	City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph, email: Faker::Internet.free_email, age: rand(20..50), city: City.all.sample)
end
# Création de 10 gossips
20.times do
	Gossip.create(title: Faker::Hipster.sentence(word_count: 3), content: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true), user_id: User.ids.sample)
end
# Création de 10 tags
10.times do
	Tag.create(title: "##{Faker::Hipster.word}")
end
# Ajout des tags aux gossips (minimum un tag par gossip)
Gossip.all.each do |g|
	n = rand(1..3)
	n.times do
		GossipTagLink.create(gossip: g, tag: Tag.all.sample)
	end
end
# Création de fakes PM
10.times do
	PrivateMessage.create(content: Faker::Hipster.paragraph_by_chars, sender: User.all.sample)
end
# Ajout des destinataires aux privates messages (minimum un destinataire par message)
PrivateMessage.all.each do |pm|
	n = rand(1..3)
	n.times do
		PrivateMessageRecipient.create(private_message: pm, recipient: User.all.sample)
	end
end
