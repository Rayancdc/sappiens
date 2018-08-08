Booking.delete_all
Experience.delete_all
User.delete_all


puts "Generating Users"
EMAILS = %w(rayancdc@gmail.com riza@testae.com edu@testae.com fbrustolini@gmail.com)
EMAILS.each do |email|
  User.create!(email: email, password: "sAppiens")
end

puts "Generating Companies"
COMPANIES = %w(iFood Spotify Meliuz Itau Airbnb HortaLab Rappi Supercell Google Facebook Bradesco TripAdvisor NuBank sAppiens)

COMPANIES.each do |company|
	new_user = User.create!(email: "#{company.downcase}@#{company.downcase}.com", password: "sAppiens")
	new_address = Address.create!(address: Faker::Address.street_address)
	new_company = Company.create!(name: company, user: new_user, address: new_address)


	puts "Generating experiences for #{company}"
	new_experience1 = Experience.create!(company: new_company, name: Faker::Name.name, description: Faker::ChuckNorris.fact, date: Faker::Date.forward(23), price: rand(3..10))

	new_experience2 = Experience.create!(company: new_company, name: Faker::Name.name, description: Faker::ChuckNorris.fact, date: Faker::Date.forward(23), price: rand(3..10))
end


10.times do 
	user = User.all.sample
	experience = Experience.all.sample

	booking = Booking.new(user: user, experience: experience)
	booking.save
end