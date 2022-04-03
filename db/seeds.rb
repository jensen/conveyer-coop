# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cuisine = Cuisine.create([
                           { name: "Chicken" },
                           { name: "Burgers" },
                           { name: "Fast Food" },
                           { name: "Desserts" },
                           { name: "Bakery" },
                           { name: "Pizza" },
                           { name: "Salad" },
                           { name: "Seafood" },
                           { name: "Vegan" },
                           { name: "Sandwiches" }
                         ])

hifive = Restaurant.create({
                             name: "Hi Five Chicken",
                             cost: 2
                           })

hifive.culinary_styles.create(
  cuisine: cuisine.first
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
  cuisine: cuisine.first
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

half_slab_ribs = juke_bbq_pork_ribs.menu_items.create(
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
  cuisine: cuisine.first
)

kfc.culinary_styles.create(
  cuisine: cuisine.third
)

kfc.images.create(
  name: "e327f6d7-1f00-41f1-88ba-3376a7925e75",
  extension: "jpg"
)

wendys = Restaurant.create(
  { name: "Wendy's", cost: 1 }
)

wendys.culinary_styles.create(
  cuisine: cuisine.first
)

wendys.culinary_styles.create(
  cuisine: cuisine.second
)

wendys.culinary_styles.create(
  cuisine: cuisine.third
)

wendys.images.create(
  name: "203052",
  extension: "png"
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
