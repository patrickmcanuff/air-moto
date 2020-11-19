
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# make accounts for teammates so that they can login, make sure all users can access own stuff

puts "Destroying bookings..."
Booking.destroy_all

puts "Destroying motorcycles..."
Motorcycle.destroy_all

puts "Destroying users..."
User.destroy_all

puts "Creating users..."
johnwick = User.create(
    email: "johnwick@gmail.com",
    password: "12345678",
    name: "John Wick",
    address: "1 Wall Street Court, New York",
    drivers_license_number: Faker::DrivingLicence.british_driving_licence,
    avatar: 'https://res.cloudinary.com/dmwnfqoel/image/upload/v1605824777/user_1_g89cu0.png'
    )

15.times do
  user = User.new(
      # add email and password
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      name: Faker::Name.name,
      address: Faker::Address.full_address,
      drivers_license_number: Faker::DrivingLicence.british_driving_licence,
      avatar: 'https://res.cloudinary.com/dmwnfqoel/image/upload/v1605824777/user_1_g89cu0.png'
      )
  #fetch user profile photo from cloudinary
  #attach photo to user photo.user.attach
  user.save
end


# puts "Creating bookings..."
# Booking.create(
#     motorcycle: moto1,
#     user: johnwick,
#     date_start: Time.new(2021, 1, 2),
#     date_end: Time.new(2021, 1, 14),
# )

puts "Creating motorcycle"
file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666105/air-moto/2019_Honda_CB1000R/2019_Honda_CB1000R_1_ybhirw.jpg')
motorcycle = Motorcycle.new(year: "2019", brand: "Honda", model: "CB1000R", location: "New York, New York, USA", user: johnwick, price: 190)
motorcycle.photos.attach(io: file, filename: 'motorcycle.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article


file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666100/air-moto/2015_KTM_1290_Super_Duke_R/2015_KTM_1290_Super_Duke_R_1_mzci4x.jpg')
motorcycle = Motorcycle.new(year: "2019", brand: "Yamaha", model: "YZ250", location: "Canggu, Bali", user: User.first, price: 110)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article


file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666100/air-moto/2015_KTM_1290_Super_Duke_R/2015_KTM_1290_Super_Duke_R_1_mzci4x.jpg')
motorcycle = Motorcycle.new(year: "2015", brand: "KTM", model: "1290 Super Duke R", location: "Berlin, Germany", user: User.first, price: 220)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666105/air-moto/2014_BMW_F700GS/2014_BMW_F700GS_1_umz8qn.jpg')
motorcycle = Motorcycle.new(year: "2014", brand: "BMW", model: "F700GS", location: "Porto, Portugal", user: User.third, price: 175)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666107/air-moto/2011_Harley_Davidson_Electra_Glide/2011_Harley_Davidson_Electra_Glide_1_khunpa.jpg')
motorcycle = Motorcycle.new(year: "2003", brand: "Yamaha", model: "YZF1000R", location: "Austin, Texas, USA", user: User.second, price: 140)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666102/air-moto/2017_BMW_S1000R/2017_BMW_S1000R_1_gcbepw.jpg')
motorcycle = Motorcycle.new(year: "2018", brand: "Aprilia", model: "Shiver 900", location: "Lisbon, Portugal", user: User.second, price: 180)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666105/air-moto/2017_KTM_250_EXC-F/2017_KTM_250_EXC-F_1_dfcudh.jpg')
motorcycle = Motorcycle.new(year: "2014", brand: "Moto Guzzi", model: "V7 II Stone", location: "Budapest, Hungary", user: User.third, price: 170)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666100/air-moto/2003_Yamaha_YZF1000R/2003_Yamaha_YZF1000R_1_jtybaz.jpg')
motorcycle = Motorcycle.new(year: "2019", brand: "Husqvarna", model: "Vitpilen 701", location: "Tenerife, Canary Islands, Spain", user: User.fifth, price: 175)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666098/air-moto/2018_Aprilia_Shiver_900/2018_Aprilia_Shiver_900_1_aiz6s2.jpg')
motorcycle = Motorcycle.new(year: "2017", brand: "KTM", model: "250 EXC-F", location: "Chiang Mai, Thailand", user: User.fifth, price: 125)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article


file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666109/air-moto/2019_Yamaha_YZ250/2019_Yamaha_YZ250_1_ud6yut.jpg')
motorcycle = Motorcycle.new(year: "2019", brand: "Yamaha", model: "YZ250", location: "Canggu, Bali", user: User.first, price: 110)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article
