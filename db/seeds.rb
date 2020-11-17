require 'faker'

puts "Destroying users..."
User.destroy_all if Rails.env.development?

puts "Destroying bookings..."
Booking.destroy_all if Rails.env.development?

puts "Destroying motorcycles..."
Motorcycle.destroy_all if Rails.env.development?

puts "Creating users..."
johnwick = User.create(
    email: "johnwick@gmail.com",
    password: "12345678",
    name: "John Wick",
    address: "1 Wall Street Court, New York",
    drivers_license_number: Faker::DrivingLicence.british_driving_licence,
)

15.times do
  User.create(
      # add email and password
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      name: Faker::Name.name,
      address: Faker::Address.full_address,
      drivers_license_number: Faker::DrivingLicence.british_driving_licence,
  )
end

puts "Creating motorcycles..."
moto1 = Motorcycle.create(year: "2019", brand: "Honda", model: "CB1000R", location: "New York, New York, USA", user: johnwick)
moto2 = Motorcycle.create(year: "2019", brand: "Yamaha", model: "YZ250", location: "Canggu, Bali", user: User[2])
moto3 = Motorcycle.create(year: "2015", brand: "KTM", model: "1290 Super Duke R", location: "Berlin, Germany", user: User[3])
moto4 = Motorcycle.create(year: "2014", brand: "BMW", model: "F700GS", location: "Porto, Portugal", user: User[4])
moto5 = Motorcycle.create(year: "2011", brand: "Harley-Davidson", model: "Electra Glide", location: "Playa Del Carmen, Mexico", user: User[5])
moto6 = Motorcycle.create(year: "2017", brand: "BMW", model: "S1000R", location: "Calgary, Canada", user: User[6])
moto7 = Motorcycle.create(year: "2003", brand: "Yamaha", model: "YZF1000R", location: "Austin, Texas, USA", user: User[7])
moto8 = Motorcycle.create!(year: "2018", brand: "Aprilia", model: "Shiver 900", location: "Lisbon, Portugal", user: User[1])
moto9 = Motorcycle.create(year: "2012", brand: "Triumph", model: "Scrambler", location: "Vancouver, Canada", user: User[8])
moto10 = Motorcycle.create(year: "2014", brand: "Moto Guzzi", model: "V7 II Stone", location: "Budapest, Hungary", user: User[9])
moto11 = Motorcycle.create(year: "2019", brand: "Husqvarna", model: "Vitpilen 701", location: "Tenerife, Canary Islands, Spain", user: User[10])
moto12 = Motorcycle.create(year: "2017", brand: "KTM", model: "250 EXC-F", location: "Chiang Mai, Thailand", user: User[11])

puts "Creating bookings..."
Booking.create(
    motorcycle: moto1,
    user: johnwick,
    date_start: Time.new(2021, 1, 2),
    date_end: Time.new(2021, 1, 14),
    price: 2160
)