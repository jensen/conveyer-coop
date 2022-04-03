# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

chicken = Cuisine.create({ name: "Chicken" })
burgers = Cuisine.create({ name: "Burgers" })
fastfood = Cuisine.create({ name: "Fast Food" })
desserts = Cuisine.create({ name: "Desserts" })
bakery = Cuisine.create({ name: "Bakery" })
pizza = Cuisine.create({ name: "Pizza" })
salad = Cuisine.create({ name: "Salad" })
seafood = Cuisine.create({ name: "Seafood" })
vegan = Cuisine.create({ name: "Vegan" })
sandwiches = Cuisine.create({ name: "Sandwiches" })

hifive = Restaurant.create({
                             name: "Hi Five Chicken",
                             cost: 2
                           })

hifive.culinary_styles.create(
  cuisine: chicken
)

hifive.images.create(
  name: "7a5cb10c-2834-40a5-b28e-bd6bb25e11d9",
  extension: "jpg"
)

juke = Restaurant.create({
                           name: "Juke Fried Chicken",
                           cost: 2
                         })

juke.culinary_styles.create(
  cuisine: chicken
)

juke.images.create(
  name: "905b9ed3-f9e4-46ac-8267-12f34984c0d2",
  extension: "jpg"
)

juke_fried_chicken = juke.menu_categories.create(
  name: "Fried Chicken"
)

juke_bbq_pork_ribs = juke.menu_categories.create(
  name: "BBQ Pork Ribs"
)

juke_two_piece_chicken = juke_fried_chicken.menu_items.create(
  name: "Fried Chicken - Two Pieces",
  description: "Our crispy gluten free chicken thighs and drumsticks.  Locally sourced from Rossdown Farms.",
  price: 775
)

juke_add_a_side = juke_two_piece_chicken.modifications.create(
  name: "Add a Side",
  required: false,
  max_options: 3
)

juke_add_a_side.modification_options.create(
  name: "Sesame Slaw",
  price: 595,
  multiple: true
)

juke_add_a_side.modification_options.create(
  name: "French Fries",
  price: 499,
  multiple: true
)

juke_add_a_side.modification_options.create(
  name: "Gravy",
  price: 250,
  multiple: true
)

juke_extra_sauce = juke_two_piece_chicken.modifications.create(
  name: "Extra Sauce (+$2.00)",
  required: false,
  max_options: 2
)

juke_extra_sauce.modification_options.create(
  name: "BBQ",
  price: 200,
  multiple: true
)

juke_extra_sauce.modification_options.create(
  name: "Black Pepper Ranch Sauce",
  price: 200,
  multiple: true
)

juke_extra_sauce.modification_options.create(
  name: "Honey Mustard",
  price: 200,
  multiple: true
)

juke_extra_sauce.modification_options.create(
  name: "Hot Sauce",
  price: 200,
  multiple: true
)

three_piece_chicken = juke_fried_chicken.menu_items.create(
  name: "Fried Chicken - Three Pieces",
  description: "Our crispy gluten free chicken thighs and drumsticks.  Locally sourced from Rossdown Farms.",
  price: 1025
)

three_piece_chicken.modifications << juke_add_a_side
three_piece_chicken.modifications << juke_extra_sauce

juke_fried_chicken.menu_items.create(
  name: "Fried Chicken - Five Pieces",
  description: "Our crispy gluten free chicken thighs and drumsticks.  Locally sourced from Rossdown Farms.",
  price: 1825
)

juke_fried_chicken.menu_items.create(
  name: "Fried Chicken - Ten Pieces",
  description: "Our crispy gluten free chicken thighs and drumsticks.  Locally sourced from Rossdown Farms.",
  price: 3025
)

juke_bbq_pork_ribs.menu_items.create(
  name: "Half Slab",
  description: "Half slab of BBQ pork ribs smothered with Juke's famous BBQ sauce.",
  price: 1840
)

juke_bbq_pork_ribs.menu_items.create(
  name: "Quarter Slab",
  description: "Quarter slab of BBQ pork ribs smothered with Juke's famous BBQ sauce.",
  price: 1140
)

juke_bbq_pork_ribs.menu_items.create(
  name: "Full Slab",
  description: "Full slab of BBQ pork ribs smothered with Juke's famous BBQ sauce.",
  price: 3075
)

kfc = Restaurant.create(
  { name: "KFC", cost: 2 }
)

kfc.culinary_styles.create(
  cuisine: chicken
)

kfc.culinary_styles.create(
  cuisine: fastfood
)

kfc.images.create(
  name: "e327f6d7-1f00-41f1-88ba-3376a7925e75",
  extension: "jpg"
)

wendys = Restaurant.create(
  { name: "Wendy's", cost: 1 }
)

wendys.culinary_styles.create(
  cuisine: chicken
)

wendys.culinary_styles.create(
  cuisine: burgers
)

wendys.culinary_styles.create(
  cuisine: fastfood
)

wendys.images.create(
  name: "203052",
  extension: "png"
)

dq = Restaurant.create({
                         name: "Dairy Queen",
                         cost: 1
                       })

dq.culinary_styles.create([
                            { cuisine: chicken },
                            { cuisine: burgers },
                            { cuisine: fastfood },
                            { cuisine: desserts },
                          ])

dq.images.create(
  name: "a2aca04a-4f16-4902-b372-007a1b3ea5c4",
  extension: "jpg"
)

lees = Restaurant.create({
                           name: "Lee's Donuts",
                           cost: 2
                         })

lees.culinary_styles.create([
                              { cuisine: fastfood },
                              { cuisine: desserts },
                              { cuisine: bakery }
                            ])

lees.images.create(
  name: "717473ba-8e04-42ef-8f91-5ea75a135fd2",
  extension: "34"
)

panago = Restaurant.create({
                             name: "Panago Pizza",
                             cost: 2
                           })

panago.culinary_styles.create([
                                { cuisine: fastfood },
                                { cuisine: pizza }
                              ])

panago.images.create(
  name: "f1c0945d-d2ad-47ea-b34e-390dec9f7dce",
  extension: "jpg"
)

caesars = Restaurant.create({
                              name: "Little Caesars Pizza",
                              cost: 1
                            })

caesars.culinary_styles.create([
                                 { cuisine: fastfood },
                                 { cuisine: pizza }
                               ])

caesars.images.create(
  name: "23faf021-07fa-42b5-86e2-06d44281de34",
  extension: "png"
)

garden = Restaurant.create(
  name: "Pizza Garden",
  cost: 2
)

garden.culinary_styles.create([
                                { cuisine: fastfood },
                                { cuisine: pizza },
                                { cuisine: salad }
                              ])

garden.images.create(
  name: "6d1e0bde-027c-477f-8331-9d7d690dbaef",
  extension: "jpg"
)

chopped = Restaurant.create(
  name: "The Chopped Leaf",
  cost: 1
)

chopped.culinary_styles.create([
                                 { cuisine: salad }
                               ])

chopped.images.create(
  name: "19003",
  extension: "jpg"
)

chickpea = Restaurant.create(
  name: "Chickpea",
  cost: 2
)

chickpea.culinary_styles.create([
                                  { cuisine: vegan }
                                ])

chickpea.images.create(
  name: "82764",
  extension: "jpg"
)

captains = Restaurant.create(
  name: "The Captain's Boil",
  cost: 2
)

captains.culinary_styles.create([
                                  { cuisine: seafood }
                                ])

captains.images.create(
  name: "19a64972-13cd-430b-9414-6558628e42cf",
  extension: "jpeg"
)

boathouse = Restaurant.create(
  name: "The Boathouse Restaurant",
  cost: 3
)

boathouse.culinary_styles.create([
                                   { cuisine: burgers },
                                   { cuisine: seafood },
                                   { cuisine: salad }
                                 ])

boathouse.images.create(
  name: "9a225286-89c4-475b-98ff-c939db38a6c6",
  extension: "jpg"
)

subway = Restaurant.create(
  name: "Subway",
  cost: 1
)

subway.culinary_styles.create([
                                { cuisine: fastfood },
                                { cuisine: sandwiches }
                              ])

subway.images.create(
  name: "55699",
  extension: "jpg"
)

paneformaggio = Restaurant.create(
  name: "Pane E Formaggio",
  cost: 2
)

paneformaggio.culinary_styles.create([
                                       { cuisine: bakery },
                                       { cuisine: sandwiches }
                                     ])

paneformaggio.images.create(
  name: "66bca628-e24f-41c9-817e-a566b4e1dbbf",
  extension: "jpg"
)

vancouver = City.create({ name: "Vancouver" })

juke.stores.create({
                     address: '182 Keefer Street',
                     postal_code: 'V6A 1X4',
                     city: vancouver
                   })

kfc.stores.create([{
                     address: '795 E Broadway',
                     postal_code: 'V5T 1X8',
                     city: vancouver
                   },
                   {
                     address: '2190 Kingsway',
                     postal_code: 'V5N 2T5',
                     city: vancouver
                   }])

user = User.create({ email: "test@user.com", password: "123" })

Profile.create(
  address: "123 User Address",
  postal_code: "A1A 1A1",
  city: vancouver,
  user: user
)
