require 'open-uri'

puts "Cleaning database.."

User.destroy_all
Animal.destroy_all
Post.destroy_all
Review.destroy_all

puts "Creating database.."

puts "Creando usuario..."
user = User.new(email: "maria.18@gmail.com", password: "1234567")
photo = URI.open("https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
user.photo.attach(io: photo, filename: "maria.png", content_type: "img/png")
user.save

user1 = User.new(email: "andres.18@gmail.com", password: "1234567")
photo1 = URI.open("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
user1.photo.attach(io: photo1, filename: "andres.png", content_type: "img/png")
user1.save

user2 = User.new(email: "david.gonzales@gmail.com", password: "1234567")
photo2 = URI.open("https://images.pexels.com/photos/2406949/pexels-photo-2406949.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
user2.photo.attach(io: photo2, filename: "david-gonzales.png", content_type: "img/png")
user2.save

user3 = User.new(email: "andrea.18@gmail.com", password: "1234567")
photo3 = URI.open("https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
user3.photo.attach(io: photo3, filename: "andrea.png", content_type: "img/png")
user3.save

user4 = User.new(email: "jack.melo@gmail.com", password: "1234567")
photo4 = URI.open("https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
user4.photo.attach(io: photo4, filename: "andrea.png", content_type: "img/png")
user4.save

user5 = User.new(email: "alejandra.zapata@gmail.com", password: "1234567")
photo5 = URI.open("https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
user5.photo.attach(io: photo5, filename: "andrea.png", content_type: "img/png")
user5.save

puts "Creando especies de animales..."
animal = Animal.create!(specie: "Perro")
animal1 = Animal.create!(specie: "Gato")

puts "Creando posts..."
post = Post.new(title: "Perro perdido parque Belén", user_id: user.id, animal_id: animal.id, address: "Cl. 25 #73-28", description: "Se me perdio mi perro la noche del 11 de octubre en el parque cerca a la carrera 72 en Belén Sanbernardo.", post_type: true, status: "Perdido", reward: true)
animal_photo = URI.open("https://images.pexels.com/photos/58997/pexels-photo-58997.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
post.photos.attach(io: animal_photo, filename: "perro.png", content_type: "img/png")
post.save

post1 = Post.new(title: "Gato perdido Biblioteca Belén" , user_id: user1.id, animal_id: animal1.id, address: "Cra. 79 #18-19", description: "Buenas noches, mi gato Bigotes se perdio en la madrugada de 13 de octubre cerca al parque biblioteca de Belén, si tienen alguna información por favor contactarse conmigo, muchas gracias.", post_type: true, status: "Entregado", reward: true)
animal_photo1 = URI.open("https://images.pexels.com/photos/1170986/pexels-photo-1170986.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
post1.photos.attach(io: animal_photo1, filename: "gato.png", content_type: "img/png")
post1.save

post2 = Post.new(title: "SE PERDIÓ EL 12 OCT", user_id: user2.id, animal_id: animal1.id, address: "Cl. 18A #77-10", description: "Hola me llamo Orion y me perdí la noche del 12 de octubre, si me has visto por favor comunicate con mis padres humanos.", post_type: true, status: "Contactado", reward: true)
animal_photo2 = URI.open("https://images.pexels.com/photos/1416803/pexels-photo-1416803.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
post2.photos.attach(io: animal_photo2, filename: "gato1.png", content_type: "img/png")
post2.save

post3 = Post.new(title: "Perro perdido", user_id: user3.id, animal_id: animal.id, address: "Cl. 16 #75-6", description: "Me he perdido. Por favor, si encuentras este peludito o piensas que lo has visto, contacte con nosotros ", post_type: true, status: "Perdido", reward: true)
animal_photo3 = URI.open("https://images.pexels.com/photos/1390784/pexels-photo-1390784.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
post3.photos.attach(io: animal_photo3, filename: "perro1.png", content_type: "img/png")
post3.save

post4 = Post.new(title: "Gatita perdida por La Playa", user_id: user4.id, animal_id: animal1.id, address: "Cl. 18 #70-25", description: "Mi gatita salíó de casa y no ha regresado, estamos muy angustiados. 😢 Sucedió en la Cl 18 Belén las playas, el 16 de octubre", post_type: true, status: "Contactado", reward: true)
animal_photo4 = URI.open("https://images.pexels.com/photos/1521306/pexels-photo-1521306.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
post4.photos.attach(io: animal_photo4, filename: "gato2.png", content_type: "img/png")
post4.save

post5 = Post.new( title: "Perrito encontrado Juan pablo II", user_id: user5.id, animal_id: animal.id, address: "Cl. 16 #75-6", description: "Se encontro este hermoso Yorki en la Cra. 70, cerca al Parque Juan Pablo II, se encuentra bien de salud.", post_type: false, status: "Contactado", reward: false)
animal_photo5 = URI.open("https://images.pexels.com/photos/1420405/pexels-photo-1420405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
post5.photos.attach(io: animal_photo5, filename: "perro2.png", content_type: "img/png")
post5.save

puts "Creando reviews..."
review = Review.create!(post_id: post.id, user_id: user.id , content: "Estoy sumamente agradecida con la comunidad en Paws finder por ayudarme a encontrar a Dolly")
review1 = Review.create!(post_id: post1.id, user_id: user1.id , content: "Cuando mi gatito se perdió hace unos días estabamos muy angustiados sin saber que hacer, dimos por casualidad con ésta página y luego de unos días vimos fotos de nuestro bebe en el barrio contiguo")
review2 = Review.create!(post_id: post2.id , user_id: user2.id , content: "Tengo un centro de rescate animal, encontramos uno con esa descripción, creo que deberian venir a verlo")
review3 = Review.create!(post_id: post3.id , user_id: user3.id , content: "Hola, creo que he visto a ese perrito en el granero el parquesito, frente al parque Belén San Bernardo")
review4 = Review.create!(post_id: post4.id , user_id: user3.id, content: "Ay!!!, espero que la encuentres rápido amiga... 😿🙏")
