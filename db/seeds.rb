require 'faker'

puts "Destroying users..."
User.destroy_all if Rails.env.development?

puts "Destroying bookings..."
Booking.destroy_all if Rails.env.development?

puts "Destroying motorcycles..."
Motorcycle.destroy_all if Rails.env.development?

puts "Creating users..."
30.Times do
  User.create(
      name: Faker::Name.name,
      address: Faker::Address.full_address,
      drivers_license_number: Faker::DrivingLicence.british_driving_licence,
  )
end

puts "Creating bookings..."
Booking.create()

puts "Creating motorcycles..."
Motorcycle.create(year: "2018", brand: "Aprilia", model: "Shiver 900", location: "Lisbon, Portugal")
Motorcycle.create(year: "2019", brand: "Yamaha", model: "YZ250", location: "Canggu, Bali")
Motorcycle.create(year: "2015", brand: "KTM", model: "1290 Super Duke R", location: "Berlin, Germany")
Motorcycle.create(year: "2014", brand: "BMW", model: "F700GS", location: "Porto, Portugal")
Motorcycle.create(year: "2011", brand: "Harley-Davidson", model: "Electra Glide", location: "Playa Del Carmen, Mexico")
Motorcycle.create(year: "2017", brand: "BMW", model: "S1000R", location: "Calgary, Canada")
Motorcycle.create(year: "2003", brand: "Yamaha", model: "YZF1000R", location: "Austin, Texas, United States")
Motorcycle.create(year: "2019", brand: "Honda", model: "CB1000R", location: "Sydney, Australia")
Motorcycle.create(year: "2012", brand: "Triumph", model: "Scrambler", location: "Vancouver, Canada")
Motorcycle.create(year: "2014", brand: "Moto Guzzi", model: "V7 II Stone", location: "Budapest, Hungary")
Motorcycle.create(year: "2019", brand: "Husqvarna", model: "Vitpilen 701", location: "Tenerife, Canary Islands, Spain")
Motorcycle.create(year: "2017", brand: "KTM", model: "250 EXC-F", location: "Chiang Mai, Thailand")