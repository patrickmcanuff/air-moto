
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# require 'open-uri'

# make accounts for teammates so that they can login, make sure all users can access own stuff

puts "Destroying bookings..."
Booking.destroy_all

puts "Destroying motorcycles..."
Motorcycle.destroy_all

puts "Destroying users..."
User.destroy_all

puts "Creating users..."

file = URI.open('https://avatarfiles.alphacoders.com/224/thumb-224371.jpg')
johnwick = User.new(
    email: "johnwick@gmail.com",
    password: "12345678",
    name: "John Wick",
    address: "1 Wall Street Court, New York",
    drivers_license_number: Faker::DrivingLicence.british_driving_licence,
    avatar: "https://avatarfiles.alphacoders.com/224/thumb-224371.jpg"
    )
    johnwick.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    johnwick.save

file = URI.open("https://cdn.pixabay.com/photo/2020/07/14/13/07/icon-5404125_960_720.png")
15.times do
  user = User.new(
      # add email and password
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      name: Faker::Name.name,
      address: Faker::Address.full_address,
      drivers_license_number: Faker::DrivingLicence.british_driving_licence,
      avatar: "https://cdn.pixabay.com/photo/2020/07/14/13/07/icon-5404125_960_720.png"
      )
    # user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    user.save
  #fetch user profile photo from cloudinary
  #attach photo to user photo.user.attach
end


# puts "Creating bookings..."
# Booking.create(
#     motorcycle: moto1,
#     user: johnwick,
#     date_start: Time.new(2021, 1, 2),
#     date_end: Time.new(2021, 1, 14),
# )

puts "Creating motorcycles..."
file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666105/air-moto/2014_Moto_Guzzi_V7_II_Stone/2014_Moto_Guzzi_V7_II_Stone_1_jepsqh.jpg')
file2 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666104/air-moto/2014_Moto_Guzzi_V7_II_Stone/2014_Moto_Guzzi_V7_II_Stone_2_gemfcz.jpg')
file3 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666104/air-moto/2014_Moto_Guzzi_V7_II_Stone/2014_Moto_Guzzi_V7_II_Stone_3_enrfyv.jpg')
motorcycle = Motorcycle.new(year: "2014", brand: "Moto Guzzi", model: "V7 II Stone", location: "Braga, Portugal", user: User.third, price: 170)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666109/air-moto/2019_Yamaha_YZ250/2019_Yamaha_YZ250_1_ud6yut.jpg')
file2 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666108/air-moto/2019_Yamaha_YZ250/2019_Yamaha_YZ250_2_op8kuw.jpg')
file3 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666108/air-moto/2019_Yamaha_YZ250/2019_Yamaha_YZ250_3_uldkpc.jpg')
motorcycle = Motorcycle.new(year: "2019", brand: "Yamaha", model: "YZ250", location: "Coimbra, Portugal", user: User.first, price: 110)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666105/air-moto/2019_Honda_CB1000R/2019_Honda_CB1000R_1_ybhirw.jpg')
file2 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666105/air-moto/2019_Honda_CB1000R/2019_Honda_CB1000R_3_teml9q.jpg')
file3 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666106/air-moto/2019_Honda_CB1000R/2019_Honda_CB1000R_2_qyncct.jpg')
motorcycle = Motorcycle.new(year: "2019", brand: "Honda", model: "CB1000R", location: "Faro, Portugal", user: johnwick, price: 190)
motorcycle.photos.attach(io: file, filename: 'motorcycle.png', content_type: 'image/png')
motorcycle.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666100/air-moto/2015_KTM_1290_Super_Duke_R/2015_KTM_1290_Super_Duke_R_1_mzci4x.jpg')
file2 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666099/air-moto/2015_KTM_1290_Super_Duke_R/2015_KTM_1290_Super_Duke_R_2_lm9wbu.jpg')
file3 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666099/air-moto/2015_KTM_1290_Super_Duke_R/2015_KTM_1290_Super_Duke_R_3_ibqz1o.jpg')
motorcycle = Motorcycle.new(year: "2015", brand: "KTM", model: "1290 Super Duke R", location: "Lisbon, Portugal", user: User.first, price: 220)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666102/air-moto/2017_BMW_S1000R/2017_BMW_S1000R_1_gcbepw.jpg')
file2 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666101/air-moto/2017_BMW_S1000R/2017_BMW_S1000R_2_jndgqb.jpg')
file3 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666102/air-moto/2017_BMW_S1000R/2017_BMW_S1000R_3_iz1vwl.jpg')
motorcycle = Motorcycle.new(year: "2017", brand: "BMW", model: "S1000R", location: "Lisbon, Portugal", user: User.fifth, price: 210)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666099/air-moto/2018_Aprilia_Shiver_900/2018_Aprilia_Shiver_900_2_iuovzg.jpg')
file2 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666098/air-moto/2018_Aprilia_Shiver_900/2018_Aprilia_Shiver_900_1_aiz6s2.jpg')
file3 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666098/air-moto/2018_Aprilia_Shiver_900/2018_Aprilia_Shiver_900_3_fw54uv.jpg')
motorcycle = Motorcycle.new(year: "2018", brand: "Aprilia", model: "Shiver 900", location: "Lisbon, Portugal", user: User.second, price: 180)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666105/air-moto/2017_KTM_250_EXC-F/2017_KTM_250_EXC-F_1_dfcudh.jpg')
file2 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666105/air-moto/2017_KTM_250_EXC-F/2017_KTM_250_EXC-F_2_olidr9.jpg')
file3 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666109/air-moto/2017_KTM_250_EXC-F/2017_KTM_250_EXC-F_3_adjrk8.jpg')
motorcycle = Motorcycle.new(year: "2017", brand: "KTM", model: "250 EXC-F", location: "Lisbon, Portugal", user: User.fifth, price: 125)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666109/air-moto/2019_Husqvarna_Vitpilen_701/2019_Husqvarna_Vitpilen_701_1_jdab7w.png')
file2 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666107/air-moto/2019_Husqvarna_Vitpilen_701/2019_Husqvarna_Vitpilen_701_2_xd354n.png')
file3 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666107/air-moto/2019_Husqvarna_Vitpilen_701/2019_Husqvarna_Vitpilen_701_3_oon3qm.png')
motorcycle = Motorcycle.new(year: "2019", brand: "Husqvarna", model: "Vitpilen 701", location: "Porto, Portugal", user: User.fifth, price: 175)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666105/air-moto/2014_BMW_F700GS/2014_BMW_F700GS_1_umz8qn.jpg')
file2 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666103/air-moto/2014_BMW_F700GS/2014_BMW_F700GS_2_ktx2tv.jpg')
file3 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666103/air-moto/2014_BMW_F700GS/2014_BMW_F700GS_3_dnilgc.jpg')
motorcycle = Motorcycle.new(year: "2014", brand: "BMW", model: "F700GS", location: "Porto, Portugal", user: User.third, price: 175)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666103/air-moto/2012_Triumph_Scrambler/2012_Triumph_Scrambler_1_djjfrs.jpg')
file2 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666101/air-moto/2012_Triumph_Scrambler/2012_Triumph_Scrambler_2_iydjv7.jpg')
file3 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666102/air-moto/2012_Triumph_Scrambler/2012_Triumph_Scrambler_3_q6suhz.jpg')
motorcycle = Motorcycle.new(year: "2012", brand: "Triumph", model: "Scrambler", location: "Porto, Portugal", user: User.third, price: 165)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666107/air-moto/2011_Harley_Davidson_Electra_Glide/2011_Harley_Davidson_Electra_Glide_1_khunpa.jpg')
file2 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666107/air-moto/2011_Harley_Davidson_Electra_Glide/2011_Harley_Davidson_Electra_Glide_3_mgvfhl.jpg')
file3 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666107/air-moto/2011_Harley_Davidson_Electra_Glide/2011_Harley_Davidson_Electra_Glide_2_p6js5p.jpg')
motorcycle = Motorcycle.new(year: "2011", brand: "Harley-Davidson", model: "Electra Glide", location: "Porto, Portugal", user: User.fourth, price: 120)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article

file = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666100/air-moto/2003_Yamaha_YZF1000R/2003_Yamaha_YZF1000R_2_n7ssvv.jpg')
file2 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666100/air-moto/2003_Yamaha_YZF1000R/2003_Yamaha_YZF1000R_1_jtybaz.jpg')
file3 = URI.open('https://res.cloudinary.com/dwxhfawho/image/upload/v1605666103/air-moto/2003_Yamaha_YZF1000R/2003_Yamaha_YZF1000R_3_fot7rf.jpg')
motorcycle = Motorcycle.new(year: "2003", brand: "Yamaha", model: "YZF1000R", location: "Madeira, Portugal", user: User.second, price: 140)
motorcycle.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
motorcycle.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
motorcycle.save # this will upload the file we just downloaded to CL and attach it to the new article
