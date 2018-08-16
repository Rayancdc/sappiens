Booking.delete_all
Event.delete_all
Experience.delete_all
Company.delete_all
User.delete_all

puts "Generating Seeds"

ADDRESSES = ['Rua Mourato Coelho 1404 São Paulo', 'Rua Zapara 114 São Paulo', 'Rua Pedro Ortiz 129 São Paulo', 'Rua Pinheiros 1000, São Paulo', 'Rua Arapiraca 22 São Paulo', 'Avenida Faria Lima 1830 São Paulo', 'Avenida Rebouças 1309 São Paulo', 'Avenida Brasil 1000, São Paulo', 'Rua Mourato Coelho 900 São Paulo', 'Alameda Campinas 114 São Paulo']

# CAREERS = ["Computer User Support Specialist", "Junior Data Analyst", "Computer Network Support Specialist", "Digital Marketer", "Cyber Security Analysts", "Multimedia Artist", "Web Developer", "Aerospace Engineering", "Information Technology Manager", "Product Management", "Growth Hacking", "Data Mining", "Data Science"]

COMPANIES = %w(Spotify Meliuz Itaú Airbnb HortaLab Google Facebook TripAdvisor Embraer sAppiens)

USERS = [
 { name: 'Rayan', email: 'rayancdc@gmail.com' },
 { name: 'Edu', email: 'edu@gmail.com' },
 { name: 'Riza', email: 'riza@gmail.com' },
 { name: 'Fernando', email: 'fernando@gmail.com' },
 { name:'Carolina', email: 'carolina@gmail.com' },
 { name:'Bianca', email: 'bianca@gmail.com' },
 { name:'Pedro', email: 'pedro@gmail.com' },
 { name:'Marco', email: 'marco@gmail.com' },
 { name:'Margo', email: 'margo@gmail.com' },
 { name:'Johny', email: 'johny@gmail.com' }
]

EXPERIENCES = [
{price_cents: 5000 + rand(5000), career:  'Product Management', description: 'Develops products by identifying potential products; conducting market research; generating product requirements; determining specifications,production timetables, pricing, and time-integrated plans forproduct introduction; developing marketing strategies,' },
{price_cents: 5000 + rand(5000), career:  'Growth Hacking', description: 'Growth hacking is a process of rapid experimentation across marketing funnel, product development, sales segments, and other areas of the business to identify the most efficient ways to grow a business.' },
{price_cents: 5000 + rand(5000), career:  'Software Development', description: 'Web developers are the behind-the-scenes staff of the Internet: they design, create, and maintain websites. This involves writing code for the site, making layout decisions, considering the user interface, solving bugs/problems that emerge, and more. Many web developers are completely self-taught, while others have associate’s degrees or other formal certifications.' },
{price_cents: 5000 + rand(5000), career:  'Data Mining', description: 'Data mining is a process used by companies to turn raw data into useful information. By using software to look for patterns in large batches of data, businesses can learn more about their customers and develop more effective marketing strategies as well as increase sales and decrease costs.'},
{price_cents: 5000 + rand(5000), career:  'Data Science', description: 'Data Science is an interdisciplinary field that uses scientific methods, processes, algorithms and systems to extract knowledge and insights from datain various forms, both structured and unstructured, similar to data mining.' },
{price_cents: 5000 + rand(5000), career:  'Computer User Support Specialist', description: 'Computer user support specialists provide technical assistance to users by answering questions or resolving computer problems. This can be in person, through telephone or electronically (over chat messaging or email).' },
{price_cents: 5000 + rand(5000), career:  'Junior Data Analyst', description: 'Data is so hot right now that even entry-level analysts can make good money. Usually, junior analysts are the ones who conduct searches for data, create Excel spreadsheets and generate material for analysis, and present their findings to more senior colleagues, who handle the bulk of the more complex work.' },
{price_cents: 5000 + rand(5000), career:  'Computer Network Support Specialist', description: 'Computer network support specialists are responsible for keeping networks running smoothly. They test, troubleshoot, analyze, perform maintenance, and solve network problems. Usually you’ll need a certificate or associate’s degree to enter this career.' },
{price_cents: 5000 + rand(5000), career:  'Digital Marketer', description: 'Marketing via the Internet is one of the primary ways companies reach customers in the 21st century. Digital marketers enable this in a variety of ways: search engine optimization (SEO), search engine marketing (SEM), social media marketing, content marketing, e-mail marketing, and others. Often a digital marketer will specialize in only one or two of these areas.' },
{price_cents: 5000 + rand(5000), career:  'Cyber Security Analysts', description: 'Many cyber security professionals who obtain four-year degrees head straight for the higher-up positions after graduating, leaving companies with a dearth of entry-level workers to handle a lot of the day-to-day. Junior cyber security analysts handle the “grunt work” like reviewing logs, controlling network settings, doing basic testing, etc.' },
{price_cents: 5000 + rand(5000), career:  'Multimedia Artist', description: 'Multimedia artists often do have bachelor’s degrees, but they are not required. They work with various programs and technologies to develop animation, designs and special effects for movies, commercials, video games and other forms of electronic media.' },
{price_cents: 5000 + rand(5000), career:  'Web Developer', description: 'Web developers are the behind-the-scenes staff of the Internet: they design, create, and maintain websites. This involves writing code for the site, making layout decisions, considering the user interface, solving bugs/problems that emerge, and more. Many web developers are completely self-taught, while others have associate’s degrees or other formal certifications,' },
{price_cents: 5000 + rand(5000), career:  'Aerospace Engineer', description: 'You might expect something this advanced-sounding to require a four-year degree, but in reality most aerospace engineering and operations technicians only need an associate’s. They are responsible for operating and caring for the equipment used to build and test aircraft and spacecraft' },
{price_cents: 5000 + rand(5000), career:  'Information Technology Manager', description: 'By working your way up from starter IT roles, you can eventually become an IT manager in a department. Managers often supervise teams, as well as being responsible for monitoring the company’s IT infrastructure. They are also the ones who develop the rules and protocol governing the use of company computers, data, and network access.' }
]



USERS.each_with_index do |user, i|
  new_user = User.create!(email: user[:email], password: "sappiens", name: user[:name])
  new_company = Company.create!(name: COMPANIES[i]  , user: new_user, address: ADDRESSES[i])
  new_experience = new_company.experiences.build(EXPERIENCES[i])
  new_experience.save
  10.times do
    new_event = new_experience.events.build(date: rand(30).day.from_now)
    new_event.save
  end
end

STUDENTS = [
 { name: 'Isadora', email: 'isadora@gmail.com' },
 { name: 'Liza', email: 'liza@gmail.com' },
 { name: 'Bernardo', email: 'bernardo@gmail.com' },
 { name: 'André', email: 'andre@gmail.com' },
 { name: 'Felipe', email: 'felipe@gmail.com' },
 { name:'Camila', email: 'camila@gmail.com' },
 { name:'Erika', email: 'erica@gmail.com' },
 { name:'Marina', email: 'marina@gmail.com' },
 { name:'Madalena', email: 'madalena@gmail.com' },
 { name:'Luiza', email: 'luiza@gmail.com' }
]

STUDENTS.each_with_index do |user, i|
  new_student = User.create!(email: user[:email], password: "sappiens", name: user[:name])

  5.times do
    event = Event.all.sample
    booking = Booking.new(user: new_student, event: event)
    booking.save
  end
end

# puts "Generating Companies"
puts "You have #{User.count} users, #{Company.count} companies, #{Experience.count} experiences, #{Event.count} events and #{Booking.count} bookings"

# COMPANIES.each do |company|
# 	new_user = User.create!(email: "#{company.downcase}@#{company.downcase}.com", password: "sappiens", name: company)
# 	new_address = Address.create!(field_1: Faker::Address.street_address, city: Faker::Address.city_prefix, state: Faker::Address.state, zipcode: Faker::Address.zip_code)
# 	new_company = Company.create!(name: company, user: new_user, address: new_address)


# 	puts "Generating experiences for #{company}"
# 	new_experience1 = Experience.create!(company: new_company, name: Faker::Name.name, description: Faker::ChuckNorris.fact, date: Faker::Date.forward(23), price_cents: rand(300..10000))

# 	new_experience2 = Experience.create!(company: new_company, name: Faker::Name.name, description: Faker::ChuckNorris.fact, date: Faker::Date.forward(23), price_cents: rand(300..10000))
# end



