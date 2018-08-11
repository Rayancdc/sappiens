Booking.delete_all
Experience.delete_all
Company.delete_all
User.delete_all

puts "Generating Seeds"

ADDRESSES = ['Rua Mourato coelho 1404 sao paulo', 'Rua Zapara 114 Sao paulo', 'Rua pedro ortiz 129 sao paulo', 'Rua pinheiros 1000, sao paulo']

CAREERS = ["Product Management", "Growth Hacking", "Software Development", "Data Mining", "Data Science"]

COMPANIES = %w(iFood Spotify Meliuz Itau Airbnb HortaLab Rappi Supercell Google Facebook Bradesco TripAdvisor NuBank sAppiens)

USERS = [
  { name: 'Rayan', email: 'rayancdc@gmail.com' },
  { name: 'Edu', email: 'edu@gmail.com' },
  { name: 'Riza', email: 'riza@gmail.com' },
  { name: 'Fernando', email: 'fernando@gmail.com' }
]

USERS.each_with_index do |user, i|
  new_user = User.create!(email: user[:email], password: "sappiens", name: user[:name])
  new_company = Company.create!(name: COMPANIES.sample, user: new_user, address: ADDRESSES[i])
  new_experience = new_company.experiences.build(career: CAREERS.sample, description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore suscipit dignissimos repellendus, quibusdam rem natus ut quo, aliquam reiciendis odio non, maxime blanditiis eaque, et. Veritatis quaerat similique eum! Laborum.", date: Faker::Date.forward(23), price_cents: rand(300..10000) )
  new_experience.save
end

5.times do
  user = User.all.sample
  experience = Experience.all.sample

  booking = Booking.new(user: user, experience: experience)
  booking.save
end

# puts "Generating Companies"
puts "You have #{User.count} users, #{Company.count} companies, #{Experience.count} experiences and #{Booking.count} bookings"

# COMPANIES.each do |company|
# 	new_user = User.create!(email: "#{company.downcase}@#{company.downcase}.com", password: "sappiens", name: company)
# 	new_address = Address.create!(field_1: Faker::Address.street_address, city: Faker::Address.city_prefix, state: Faker::Address.state, zipcode: Faker::Address.zip_code)
# 	new_company = Company.create!(name: company, user: new_user, address: new_address)


# 	puts "Generating experiences for #{company}"
# 	new_experience1 = Experience.create!(company: new_company, name: Faker::Name.name, description: Faker::ChuckNorris.fact, date: Faker::Date.forward(23), price_cents: rand(300..10000))

# 	new_experience2 = Experience.create!(company: new_company, name: Faker::Name.name, description: Faker::ChuckNorris.fact, date: Faker::Date.forward(23), price_cents: rand(300..10000))
# end



