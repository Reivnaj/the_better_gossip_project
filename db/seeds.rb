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
Like.destroy_all
Comment.destroy_all
GossipTagLink.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessageRecipient.destroy_all
PrivateMessage.destroy_all
User.destroy_all
City.destroy_all

# Remettre les compteurs à 0
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

# Création de 10 villes
10.times do |i|
	City.create(name: Faker::Address.unique.city, zip_code: Faker::Address.unique.zip_code)
	puts "#{i+1} ville créée"
end
puts "-"*50

# Création de 10 utilisateurs
10.times do |i|
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: true), email: Faker::Internet.free_email, age: rand(20..50), city: City.all.sample)
	puts "#{i+1} utilisateur créé"
end
puts "-"*50

# Création  de l'anonymous
anonymous = User.create(first_name: 'anonymous', last_name: 'anonymous', description: 'I am anonymous', email: 'anonymous@anonymous.com', age: 70, city: City.first)
puts "utilisateur anonyme créé"
puts "-"*50

# Création de 10 gossips
20.times do |i|
	Gossip.create(title: Faker::Book.unique.genre[0..12], content: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: true), user_id: User.ids.sample)
puts "#{i+1} potin créé"
end
puts "-"*50

# Création de 10 tags
10.times do |i|
	Tag.create(title: "##{Faker::Color.unique.color_name.gsub(/\s+/, "_")}")
	puts "#{i+1} tag créé"
end
puts "-"*50

# Ajout des tags aux gossips (minimum un tag par gossip)
Gossip.all.each_with_index do |g, i|
	n = rand(1..3)
	n.times do |j|
		GossipTagLink.create(gossip: g, tag: Tag.find(n+j+1))
	end
	puts "#{n} tags ajoutés au potin #{i+1}"
end
puts "-"*50

# Création de fakes PM
10.times do |i|
	PrivateMessage.create(content: Faker::Hipster.paragraph_by_chars, sender: User.find(i+1))
	puts "#{i+1} message privé créé"
end
puts "-"*50

# Ajout des destinataires aux privates messages (minimum un destinataire par message)
PrivateMessage.all.each_with_index do |pm, i|
	n = rand(1..3)
	n.times do
		PrivateMessageRecipient.create(private_message: pm, recipient: User.where.not(id: pm.sender_id).sample)
	end
	puts "#{n} destinataires ajoutés au message privé #{i+1}"
end
puts "-"*50

puts "Seed terminé"
