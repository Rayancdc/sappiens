Booking.delete_all
Experience.delete_all
Company.delete_all
User.delete_all


puts "Generating Users"
USERS = [
	{name: 'Rayan', email: 'rayancdc@gmail.com' },
	{name: 'Edu', email: 'edu@gmail.com' },
	{name: 'Riza', email: 'riza@gmail.com' },
	{name: 'Fernando', email: 'fernando@gmail.com' },
]
USERS.each do |user|
  User.create!(email: user[:email], password: "123456", name: user[:name])
end

puts "Generating Companies"
COMPANIES = %w(iFood Spotify Meliuz Itau Airbnb HortaLab Rappi Supercell Google Facebook Bradesco TripAdvisor NuBank sAppiens)

COMPANIES.each do |company|
	new_user = User.create!(email: "#{company.downcase}@#{company.downcase}.com", password: "sAppiens", name: company)
	new_address = Address.create!(field_1: Faker::Address.street_address, city: Faker::Address.city_prefix, state: Faker::Address.state, zipcode: Faker::Address.zip_code)
	new_company = Company.create!(name: company, user: new_user, address: new_address)


	puts "Generating experiences for #{company}"
	new_experience1 = Experience.create!(company: new_company, name: Faker::Name.name, description: Faker::ChuckNorris.fact, date: Faker::Date.forward(23), price_cents: rand(300..10000))

	new_experience2 = Experience.create!(company: new_company, name: Faker::Name.name, description: Faker::ChuckNorris.fact, date: Faker::Date.forward(23), price_cents: rand(300..10000))
end


10.times do 
	user = User.all.sample
	experience = Experience.all.sample

	booking = Booking.new(user: user, experience: experience)
	booking.save
end