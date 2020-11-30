# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.destroy_all
User.destroy_all
Species.destroy_all


user1 = User.create!(
  first_name: "Anna",
  last_name: "Chedeville",
  username: "Chedanna",
  diving_level: "TSD",
  description: "Princesse Anna",
  email: "anna@example.com",
  password: "password",
  )
user1.avatar.attach(io: File.open(Rails.root.join('db/fixtures/avatars/Anna.png')), filename: 'Anna.png')
user1.save!

user2 = User.create!(
  first_name: "Brandon",
  last_name: "Ruaux",
  username: "Plongeur fou",
  diving_level: "DM",
  description: "27 et passioné par la vie.",
  email: "brandon@example.com",
  password: "password",
  )
user2.avatar.attach(io: File.open(Rails.root.join('db/fixtures/avatars/brandon.png')), filename: 'brandon.png')
user2.save!

user3 = User.create!(
  first_name: "Briac",
  last_name:"Louazel",
  username:"Blouazel",
  diving_level:"Open Water",
  description:"Marketplace expert",
  email: "briac@example.com",
  password: "password",
  )
user3.avatar.attach(io: File.open(Rails.root.join('db/fixtures/avatars/Briac.jpg')), filename: 'Briac.jpg')
user3.save!

user4 = User.create!(
  first_name: "Celeste",
  last_name:"Gautier",
  username:"Celeston",
  diving_level:"Open Water",
  description:"Reine du front",
  email: "celeste@examplebis.com",
  password: "password",
  )
user4.avatar.attach(io: File.open(Rails.root.join('db/fixtures/avatars/Celeste.jpg')), filename: 'Celeste.jpg')
user4.save!

user5 = User.create!(
  first_name: "Christine",
  last_name:"Brendle",
  username:"XtineHK",
  diving_level:"TSD",
  description:"Made in Hong Kong",
  email: "christine@example.com",
  password: "password",
  )
user5.avatar.attach(io: File.open(Rails.root.join('db/fixtures/avatars/Xtine.png')), filename: 'Xtine.png')
user5.save!

user6 = User.create!(
  first_name: "Gabin",
  last_name:"Louazel",
  username:"Glouazel",
  diving_level:"TSD",
  description:"Graine de grand marin",
  email: "gabin@example.com",
  password: "password",
  )
user6.avatar.attach(io: File.open(Rails.root.join('db/fixtures/avatars/Gabin.png')), filename: 'Gabin.png')
user6.save!

user7 = User.create!(
  first_name: "Marek",
  last_name:"Chrzestek",
  username:"Marekredon",
  diving_level:"INSTRUCTOR",
  description:"Le joueur",
  email: "marek@example.com",
  password: "password",
  )
user7.avatar.attach(io: File.open(Rails.root.join('db/fixtures/avatars/Marek.jpg')), filename: 'Marek.jpg')
user7.save!

user8 = User.create!(
  first_name: "Paul",
  last_name:"Louazel",
  username:"Plouazel",
  diving_level:"AAC SPE Deep",
  description:"Graine de marin",
  email: "paul@example.com",
  password: "password",
  )
user8.avatar.attach(io: File.open(Rails.root.join('db/fixtures/avatars/Paul.png')), filename: 'Paul.png')
user8.save!

specie1 = Species.new(
  name: "Moonfish",
  latin_name: "Mola mola",
  description:"This fish of almost circular body, compressed laterally forms a characteristic ovoid disc. Very apparent, the two dorsal and anal fins, triangular, set back and opposite (placed opposite the body disc), serve as synchronous vertical oars. No tail replaced by bangs.",
  threat_level:"Rare species",
  size: 2,
  color: "Blue grey",
  )
specie1.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/mola-mola.jpg')), filename: 'mola-mola.jpg')
specie1.save!

specie2 = Species.new(
  name: "Great White-shark",
  latin_name: "Carcharodon carcharias",
  description: "The fusiform body of the great white shark, massive anteriorly, presents a variable gray color according to the individuals and the latitudes. Conical muzzle. The crescent moon shape of the caudal fin is characteristic.",
  threat_level: "Regulated species",
  size: 6,
  color: "Blue & white",
  )
specie2.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/requin-blanc.jpg')), filename: 'requin-blanc.jpg')
specie2.save!


specie3 = Species.new(
  name: "Green turtle",
  latin_name: "Chelonia mydas",
  description: "The green turtle is the most famous of the sea turtles. Its morphology is variable depending on its geographical area.The neck of the green turtle is short. Its head is small and non-retractable.",
  threat_level: "Regulated species",
  size: 1,
  color: "green & beige",
  )
specie3.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/tortue-verte.jpg')), filename: 'tortue-verte.jpg')
specie3.save!

specie4 = Species.new(
  name: "Thresher shark",
  latin_name: "Alopias vulpinus",
  description:"Easily recognizable, the Thresher shark is characterized by a caudal fin of almost equal size to its fusiform body. The animal can reach 6 meters and more for a weight of 500 kg! Its coat has a dark dominant color.",
  threat_level: "Endangered species",
  size: 6,
  color: "Blue",
  )
specie4.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/requin-renard.jpg')), filename: 'requin-renard.jpg')
specie4.save!

specie5 = Species.new(
  name: "Manta rays",
  latin_name: "Mobula alfredi",
  description: "Manta rays have a flattened body. The eyes and the spiracles are lateral while the 5 gill slits are on the ventral side. The head is very broad and has two cephalic fins twice as long as they are wide and are extensions of its pectoral fins.",
  threat_level: "Vulnerable species",
  size: 5,
  color: "Brown",
  )
specie5.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/raie-manta.jpg')), filename: 'raie-manta.jpg')
specie5.save!

specie6 = Species.new(
  name: "Whale shark",
  latin_name: "Rhincodon typus",
  description: "The whale shark is the largest of all cartilaginous and bony fish, reaching up to 12 m in size. It is recognizable by its flat and broad head, slit with a very large mouth which can measure up to 1.50 m wide. Its eyes are located just behind the mouth.",
  threat_level: "Vulnerable species",
  size: 8,
  color: "Blue & white",
  )
specie6.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/requin-baleine.jpg')), filename: 'requin-baleine.jpg')
specie6.save!

specie7 = Species.new(
  name: "Beluga",
  latin_name: "Delphinapterus leucas",
  description: "Its head is relatively small compared to the rest of the body, massive, but remains imposing due to the massive melon located in front of the skull. The melon is more or less accentuated and contains oil, the function of which still divides researchers.",
  threat_level: "Vulnerable species",
  size: 7,
  color: "Brown & white",
  )
specie7.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/beluga.jpg')), filename: 'beluga.jpg')
specie7.save!

specie8 = Species.new(
  name: "Seahorse",
  latin_name: "Hippocampus reidi",
  description: "The long-snouted seahorse measures around 10cm when hung (i.e. 15cm stretched), but can reach a maximum length of 17.5cm. The colors of his dress are variable: from yellow to brown, but he has tiny black dots scattered on the body. Its muzzle is long and thick.",
  threat_level: "Endangered species",
  size: 0.25,
  color: "Yellow",
  )
specie8.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/hippocampe.jpg')), filename: 'hippocampe.jpg')
specie8.save!

specie9 = Species.new(
  name: "Blue whale",
  latin_name: "Balaenoptera musculus",
  description: "The blue whale is the largest mammal on Earth. Its body is long and massive, its weight is about a hundred tons. Its head is flat in the shape of a U. The body is usually spotted. The blue whale is the most bass and loudest sounding animal in the world.",
  threat_level: "Endangered species",
  size: 25,
  color: "Blue",
  )
specie9.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/baleine-bleue.png')), filename: 'baleine-bleue.png')
specie9.save!

specie10 = Species.new(
  name: "Napoleon",
  latin_name: "Cheilinus undulatus",
  description: "The napoleon is the largest of all wrasses: it can weigh up to 190 kg. The scales are large and can reach 10 cm in diameter. The shape of the body as well as its color change during its life. Males have thick, full lips and a frontal hump that is larger the older the fish.",
  threat_level: "Endangered species",
  size: 2,
  color: "Blue & green",
  )
specie10.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/napoleon.jpg')), filename: 'napoleon.jpg')
specie10.save

specie11 = Species.new(
  name: "Clown fish",
  latin_name: "Amphiprion bicinctus",
  description: "Its color ranges from orange-yellow to brown. Two vertical white bands edged in black divide the body: the first crosses it from the back of the head, widening dorsally, the second, thinner, passes through the middle of the body. The caudal fin is truncated or slightly notched.",
  threat_level: "Endangered species",
  size: 0.2,
  color: "Orange & white",
  )
specie11.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/poisson-clown.jpg')), filename: 'poisson-clown.jpg')
specie11.save!


specie12 = Species.new(
  name: "Great barracuda",
  latin_name: "Sphyraena barracuda",
  description:"Spindle-shaped fish that can reach 2 m in length for a weight of 50 kg. As a general rule, the individuals encountered measure between 1 m and 1.40 m. The body is silvery gray, paler on the belly and often with irregular black markings.",
  threat_level:"Not very vulnerable",
  size: 2,
  color: "Silver & grey",
  )
specie12.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/barracuda.jpg')), filename: 'barracuda.jpg')
specie12.save!

specie13 = Species.new(
  name: "Leopard shark",
  latin_name: "Stegostoma fasciatum",
  description:"Shark relatively ubiquitous in the seabed, it is found on sandy bottoms, from the coast to the outer slope up to 70 m depth. He spends most of his time on the seabed.‭",
  threat_level:"Endangered species",
  size:  3.5,
  color: "Sand & yellow‭",
  )
specie13.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/requin-leopard.jpg')), filename: 'requin-leopard.jpg')
specie13.save!

specie14 = Species.new(
  name: "Eagle ray",
  latin_name: "Myliobatis aquila",
  description:"The eagle ray preferentially swims near the bottom. Its bathymetric distribution extends from the surface to a depth of about 300 meters. Even if it can be found in open water and near the surface, it mainly likes the proximity of the coasts on sandy bottoms.",
  threat_level:"Not very vulnerable",
  size: 1.8,
  color: "Brown & black",
  )
specie14.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/raie-aigle.jpg')), filename: 'raie-aigle.jpg')
specie14.save!

specie15 = Species.new(
  name: "Trunk fish",
  latin_name: "Ostracion meleagris",
  description:"It is found in lagoons, on outer slopes and mixed coral reefs up to 30 meters deep. Boxfish seek clear waters.",
  threat_level:"Not very vulnerable",
  size: 0.3,
  color: "Blue & yellow",
  )
specie15.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/poisson-coffre.jpg')), filename: 'poisson-coffre.jpg')
specie15.save!

specie16 = Species.new(
  name: "Hammerhead shark",
  latin_name: "Sphyrna lewini",
  description:"This circumtropical species is found in all tropical and warm temperate seas around the world. The scalloped hammerhead shark usually evolves between 0 and 275m depth (one baited specimen was nevertheless filmed at a depth of 512m).",
  threat_level:"Endangered species",
  size: 3.5,
  color: "Grey & brown",
  )
specie16.photo.attach(io: File.open(Rails.root.join('db/fixtures/species/requin-marteau.jpg')), filename: 'requin-marteau.jpg')
specie16.save!

tag1 = Tag.new(
  latitude:  -8.678583,
  longitude: 115.455586,
  spot_name: "Crystal Bay",
  diving_date: "2020-1-6",
  species: specie1,
  user: user1,
  description: "How lucky to be able to see the Mola Mola during this dive! We were 3 divers when we came face to face with this magnificent specimen of 2.7 during our return to the surface.",
  depth: 31
  )
tag1.photo.attach(io: File.open(Rails.root.join('db/fixtures/picture-tags/mola-mola.jpg')), filename: 'mola-mola.jpg')
tag1.save!


tag2 = Tag.new(
  latitude: -9.678583,
  longitude: 114.455586,
  spot_name: "Manta Point",
  diving_date: "2020-1-3",
  species: specie2,
  user: user2,
  description: "A pleasant dive in the Manta Rays cleaning station, a magnificent experience despite the slightly low water temperature.",
  depth: 14
  )
tag2.photo.attach(io: File.open(Rails.root.join('db/fixtures/picture-tags/manta-ray.jpg')), filename: 'manta-ray.jpg')
tag2.save!

tag3 = Tag.new(
  longitude: 43.681641,
  latitude: -18.333669,
  spot_name: "Grand tombant de la possession",
  diving_date: "2020-8-9",
  species: specie2,
  user: user3,
  description: "What a surprise to come across this BIG predator, this shark had been seen the day before and we had the chance to find it during our dive.",
  depth: 36
  )
tag3.photo.attach(io: File.open(Rails.root.join('db/fixtures/picture-tags/white-shark.jpg')), filename: 'white-shark.jpg')
tag3.save!

tag4 = Tag.new(
  longitude: 43.769531,
  latitude: -20.324024,
  spot_name: "Aquarium",
  diving_date: "2020-7-8",
  species: specie3,
  user: user4,
  description:"Always a pleasure to see a turtle evolving in its environment. We will be back to see a shark on our next dive.",
  depth: 7
  )
tag4.photo.attach(io: File.open(Rails.root.join('db/fixtures/picture-tags/green-turtle.jpg')), filename: 'green-turtle.jpg')
tag4.save!

tag5 = Tag.new(
  latitude: 47.512396,
  longitude: -61.490746,
  spot_name: "Saint Laurent",
  diving_date: "2020-8-11",
  species: specie7,
  user: user5,
  description:"As an explorer, I was delighted to meet this Beluga: a rare moment, etched forever in my memory. ",
  depth: 39
  )
tag5.photo.attach(io: File.open(Rails.root.join('db/fixtures/picture-tags/beluga.jpg')), filename: 'beluga.jpg')
tag5.save!

tag6 = Tag.new(
  longitude: 35.158233,
  latitude: 24.627271,
  spot_name: "Sharm El Lulli",
  diving_date: "2020-1-23",
  species: specie5,
  user: user6,
  description: "It was the first time I was diving in the Red Sea, but I had already observed Manta rays during previous dives in Indonesia. I was pleasantly surprised to spot this really large one: 4.2m!",
  depth: 17
  )
tag6.photo.attach(io: File.open(Rails.root.join('db/fixtures/picture-tags/manta-ray2.jpg')), filename: 'manta-ray2.jpg')
tag6.save!

tag7 = Tag.new(
  longitude: 124.106026,
  latitude: 11.348062,
  spot_name:  "Grand tombant",
  diving_date: "2020-3-12",
  species: specie4,
  user: user7,
  description: "I had heard about this place where you can observe Thresher sharks, I was not disappointed, in 4 dives we had the chance to observe more than ten!",
  depth: 27
  )
tag7.photo.attach(io: File.open(Rails.root.join('db/fixtures/picture-tags/requin-renard.jpg')), filename: 'requin-renard.jpg')
tag7.save!

tag8 = Tag.new(
  longitude: 99.994125,
  latitude: 9.698736,
  spot_name: "Sail Rock",
  diving_date: "2020-3-11",
  species: specie6,
  user: user7,
  description: "We had been talking about the famous Whale shark for 2 weeks. Observable South of Koh Tao, we had a nice surprise during an ascent, while we respected the 5m decompression stage: an unforgettable memory!",
  depth: 17
  )
tag8.photo.attach(io: File.open(Rails.root.join('db/fixtures/picture-tags/whale-shark.jpg')), filename: 'whale-shark.jpg')
tag8.save!

tag9 = Tag.new(
  longitude: 100.020218,
  latitude: 9.807011,
  spot_name: "Chumphon Pinnacle",
  diving_date: "2020-4-11",
  species: specie6,
  user: user2,
  description: "A big beast that everyone dreams of being able to observe, after more than ten dives around Tao I was finally able to see this mastodon ... I WILL BE BACK!",
  depth: 38
  )
tag9.photo.attach(io: File.open(Rails.root.join('db/fixtures/picture-tags/whale-shark.jpg')), filename: 'whale-shark.jpg')
tag9.save!

tag10 = Tag.new(
  longitude: 57.915738,
  latitude: 19.974801,
  spot_name: "Trou aux biches",
  diving_date: "2020-5-11",
  species: specie11,
  user: user1,
  description: "My daughter loves the Clown fish, which became famous thanks to the animated film 'Finding Nemo', she was amazed to be able to observe these fish in their anemones!",
  depth: 7
  )
tag10.photo.attach(io: File.open(Rails.root.join('db/fixtures/picture-tags/anemonefish.jpg')), filename: 'anemonefish.jpg')
tag10.save!

tag11 = Tag.new(
  longitude: 58.615738,
  latitude: 19.992224,
  spot_name: "Grand baie",
  diving_date: "2020-6-11",
  species: specie3,
  user: user3,
  description:"We were in Mauritius to snorkel and we let ourselves be tempted by a first dive. I swam with turtles for the first time and it was beautiful!",
  depth: 13
  )
tag11.photo.attach(io: File.open(Rails.root.join('db/fixtures/picture-tags/green-turtle2.jpg')), filename: 'green-turtle2.jpg')
tag11.save!


