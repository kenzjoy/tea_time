# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kenz = Customer.create!(
  first_name: 'Kenz',
  last_name: 'Leng',
  email: 'kenz@ilovetea.com',
  address: '318 E 3rd Ave Durango, CO 81301')

tea_1 = Tea.create!(
  title: 'Ginger Tea',
  description: 'Yogi Ginger tea is purposefully blended with Ginger, a time-honored herb with a long history of use for supporting digestion. Herbalists throughout the world have known of the rejuvenating, soothing, and invigorating qualities of Ginger, and Ayurvedic practitioners have used it as a way of activating the body’s internal energy to promote balance and harmony. Yogi Ginger tea builds on this tradition by adding a uniquely delicious blend of Lemongrass, Licorice, Peppermint, and Black Pepper for a warming and spicy tea enjoyable any time of day.',
  temperature: 'boiling water',
  brew_time: '7 minutes',
  image: 'https://yogiproducts.com/wp-content/uploads/2009/03/YT-US-Ginger-CAR-C23-202296-3DFront-WithGlow-300DPI-PNG.png'
)

subscription_1 = Subscription.create!(
  tea_id: tea_1.id,
  title: tea_1.title,
  price: 8.00,
  status: 0,
  frequency: 1
)
