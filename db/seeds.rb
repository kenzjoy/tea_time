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

zack = Customer.create!(
  first_name: 'Zack',
  last_name: 'Brinkman',
  email: 'zack@ilovetea.com',
  address: '1140 Carbon Junction #4 Durango, CO 81301')

tea_1 = Tea.create!(
  title: 'Ginger Tea',
  description: 'Yogi Ginger tea is purposefully blended with Ginger, a time-honored herb with a long history of use for supporting digestion. Herbalists throughout the world have known of the rejuvenating, soothing, and invigorating qualities of Ginger, and Ayurvedic practitioners have used it as a way of activating the body’s internal energy to promote balance and harmony. Yogi Ginger tea builds on this tradition by adding a uniquely delicious blend of Lemongrass, Licorice, Peppermint, and Black Pepper for a warming and spicy tea enjoyable any time of day.',
  temperature: 'boiling water',
  brew_time: '7 minutes',
  image: 'https://yogiproducts.com/wp-content/uploads/2009/03/YT-US-Ginger-CAR-C23-202296-3DFront-WithGlow-300DPI-PNG.png'
)

tea_2 = Tea.create!(
  title: 'Kava Stress Relief Tea',
  description: "Yogi Kava Stress Relief® tea is purposefully blended with Kava, a root traditionally used for its power to calm the body and mind and encourage a good night’s sleep. Cinnamon and Sarsaparilla add warmth and spice to this relaxing blend, while Carob Pod imparts rich flavor. Relax and find tranquility with a warm, soothing cup of Yogi Kava Stress Relief® tea.",
  temperature: 'boiling water',
  brew_time: '7 minutes',
  image: 'https://yogiproducts.com/wp-content/uploads/2009/03/YT-US-KavaStressRelief-CAR-C24-202449-3DFront_withGlow-300DPI-PNG.png'
)

tea_3 = Tea.create!(
  title: 'Egyptian Licorice Tea',
  description: 'The great pharaohs of Egypt treasured Licorice Root for its natural sweetness, rich flavor, and soothing properties. Yogi Egyptian Licorice® tea combines this delicious herb with an intriguing blend of complementary spices, including warming Cinnamon and zesty Orange Peel. Enjoy a delicious cup of Yogi Egyptian Licorice® tea for a tasty treat anytime, day or night.',
  temperature: 'boiling water',
  brew_time: '7 minutes',
  image: 'https://yogiproducts.com/wp-content/uploads/2009/03/YT-US-EgyptianLicorice-CAR-C24-202513-3DFront-WithGlow-300DPI-PNG.png,2023-02-02 16:46:44,2023-02-02 16:46:44
  4,Chai Rooibos Tea,"Evoke the beauty of South Africa with our delicious, all-organic Yogi Chai Rooibos tea—a creative twist on a traditional Chai tea blend. Rooibos, a red tea rich with antioxidants and enjoyed for centuries by the people of the Western Cape of South Africa, combines with a traditional Ayurvedic blend of Cardamom, Cinnamon, and Clove. Enjoy the spicy warmth of Yogi Chai Rooibos tea any time of day or night for an enchanting and intriguingly delicious cup of tea.",boiling water,7 minutes,https://yogiproducts.com/wp-content/uploads/2009/03/YT-US-ChaiRooibos-CAR-C24-202483-3DFront-WithGlow-300DPI-PNG.png'
)

subscription_1 = Subscription.create!(
  tea_id: tea_1.id,
  title: tea_1.title,
  price: 8.00,
  status: 0,
  frequency: 1
)

subscription_2 = Subscription.create!(
  tea_id: tea_2.id,
  title: tea_2.title,
  price: 6.25,
  status: 1,
  frequency: 0
)

subscription_3 = Subscription.create!(
  tea_id: tea_3.id,
  title: tea_3.title,
  price: 9.50,
  status: 0,
  frequency: 2
)
