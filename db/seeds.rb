# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(firstname: 'Jan',
  lastname: 'Nowak',
  email: 'jannowak@nosuchmail.com',
  password: 'testpassword',
  password_confirmation: 'testpassword')

user2 = User.create(firstname: 'Jarrett',
  lastname: 'Bordelon',
  email: 'jarrettbordelon@nosuchmail.com',
  password: 'testpassword',
  password_confirmation: 'testpassword')

user3 = User.create(firstname: 'Daisey',
  lastname: 'Moya',
  email: 'daiseymoya@nosuchmail.com',
  password: 'testpassword',
  password_confirmation: 'testpassword')

user4 = User.create(firstname: 'Yael',
  lastname: 'Jenson',
  email: 'yaeljenson@nosuchmail.com',
  password: 'testpassword',
  password_confirmation: 'testpassword')

user5 = User.create(firstname: 'Danyel',
  lastname: 'Cummins',
  email: 'danyelcummins@nosuchmail.com',
  password: 'testpassword',
  password_confirmation: 'testpassword')

adminuser = User.create(firstname: 'Admin',
  lastname: 'Admin',
  email: 'adminadmin@nosuchmail.com',
  password: 'testpassword',
  password_confirmation: 'testpassword')

category1 = Category.create(name: 'Cars')
category2 = Category.create(name: 'Phones')
category3 = Category.create(name: 'Drinks')
category4 = Category.create(name: 'Foods')

car1 = Product.create(category: category1,
  user: user1,
  title: 'Audi',
  description: 'Audi car',
  price: 70000)

car2 = Product.create(category: category1,
  user: user2,
  title: 'Mercedes',
  description: 'Mercedes car',
  price: 150000)

car3 = Product.create(category: category1,
  user: user3,
  title: 'Bugatti',
  description: 'Bugatti car',
  price: 350000)

phone1 = Product.create(category: category2,
  user: user4,
  title: 'Samsung',
  description: 'Samsung phone',
  price: 2500)

phone2 = Product.create(category: category2,
  user: user5,
  title: 'Apple',
  description: 'Apple iPhone',
  price: 4500.25)

phone3 = Product.create(category: category2,
  user: user1,
  title: 'Motorola',
  description: 'Motorola phone',
  price: 1356.79)

drink1 = Product.create(category: category3,
  user: user2,
  title: 'Coca Cola',
  description: 'Coke drink',
  price: 2.49)

drink2 = Product.create(category: category3,
  user: user3,
  title: 'Beer',
  description: 'Alcoholic beverage',
  price: 6.89)

drink3 = Product.create(category: category3,
  user: user4,
  title: 'Lemonade',
  description: 'Cheap and refreshing',
  price: 1.19)

food1 = Product.create(category: category4,
  user: user5,
  title: 'Pizza',
  description: 'Round food in square box',
  price: 18.50)

food2 = Product.create(category: category4,
  user: user1,
  title: 'Spaghetti',
  description: 'Italian pasta meal',
  price: 12.25)

food3 = Product.create(category: category4,
  user: user2,
  title: 'Burger',
  description: 'Bun, meat, lettuce, tomato, cheese',
  price: 14.99)

review_list = [
  [ 'Decent car', 4, user1, car1 ],
  [ 'Too flashy for my taste', 2, user2, car1 ],
  [ 'Good German engineering', 5, user3, car2 ],
  [ 'I prefer American cars', 1, user4, car2 ],
  [ 'Too expensive!', 1, user5, car3 ],
  [ 'Super fast, but pricy', 3, user1, car3 ],
  [ 'Decent phones, new tech', 4, user2, phone1 ],
  [ 'Too large phone', 2, user3, phone1 ],
  [ 'Perfect phone if you can afford it', 5, user4, phone2 ],
  [ 'I prefer Android phones, but the design is good', 4, user5, phone2 ],
  [ 'Phone quality is not great', 2, user1, phone3 ],
  [ 'Still waiting for firmware updates', 3, user2, phone3 ],
  [ 'Very sweet, almost too much', 3, user3, drink1 ],
  [ 'Drink it cold!', 5, user4, drink1 ],
  [ 'The perfect drink for a man', 5, user5, drink2 ],
  [ 'I am more of a wine person', 3, user1, drink2 ],
  [ 'THE drink for summer!', 5, user2, drink3 ],
  [ 'What am I, a child?', 1, user3, drink3 ],
  [ 'My top hangover food', 5, user4, food1 ],
  [ 'Too fatty, not healthy at all!', 2, user5, food1 ],
  [ 'The Italians got some things right, and this is one of them!', 5, user1, food2 ],
  [ 'I really enjoyed this meal!', 4, user2, food2 ],
  [ 'Fresh ingredients, great taste', 4, user3, food3 ],
  [ 'I had better foods', 3, user4, food3 ],
]

review_list.each do |review|
  Review.create( :content => review[0], :rating => review[1], :user => review[2], :product => review[3] )
end