puts "destroying all data..."

Contributor.destroy_all
Kitty.destroy_all
Like.destroy_all
Dream.destroy_all
User.destroy_all

puts "creating all data..."

url_user1 = "http://static1.puretrend.com/articles/5/14/98/15/@/1643505-si-leonardo-dicaprio-songe-a-fonder-une-950x0-8.jpg"
url_user2 = "https://images-na.ssl-images-amazon.com/images/M/MV5BODc4NDI1NzY5M15BMl5BanBnXkFtZTgwMTI1NTkyMTE@._V1_UX214_CR0,0,214,317_AL_.jpg"
url_user3 = "http://femme-maison.com/fm/wp-content/uploads/2016/05/Shooting-SS16-2015Q3-Image-4712-F39L-Interpol.jpg"
url_user4 = "https://pbs.twimg.com/profile_images/704803842190405635/EVYfBn8h.jpg"

user1 = User.create!(
  first_name: 'Leo',
  last_name: 'Dicap',
  email: 'leo@norris.god',
  password: 'password',
  avatar_url: url_user1
  )

user2 = User.create!(
  first_name: 'Jean',
  last_name: 'Dujardin',
  email: 'jean@norris.god',
  password: 'password',
  avatar_url: url_user2
  )

user3 = User.create!(
  first_name: 'Pamela',
  last_name: 'Anderson',
  email: 'pam@norris.god',
  password: 'password',
  avatar_url: url_user3
  )

user4 = User.create!(
  first_name: 'Soso',
  last_name: 'Malet',
  email: 'soso@norris.god',
  password: 'password',
  avatar_url: url_user4
  )


dream1 = Dream.create!(
  title: 'Travel to the end of the world',
  description: 'Sed laeditur hic coetuum magnificus splendor levitate paucorum incondita, ubi nati sunt non reputantium, sed tamquam indulta licentia vitiis ad errores lapsorum ac lasciviam. ut enim Simonides lyricus docet, beate perfecta ratione vieturo ante alia patriam esse convenit gloriosam.',
  end_date: 2.years.from_now,
  reached: false,
  user: user1,
  category: "travel",
  picture: File.open('app/assets/images/dream1.jpg')
  )

kitty1 = Kitty.create!(
  goal_amount: 200,
  dream: dream1,
  private: false
  )


dream2 = Dream.create!(
  title: 'My dream adventure',
  description: 'Sed laeditur hic coetuum magnificus splendor levitate paucorum incondita, ubi nati sunt non reputantium, sed tamquam indulta licentia vitiis ad errores lapsorum ac lasciviam. ut enim Simonides lyricus docet, beate perfecta ratione vieturo ante alia patriam esse convenit gloriosam.',
  end_date: 1.year.from_now,
  reached: false,
  user: user1,
  category: "adventure",
  picture: File.open('app/assets/images/dream2.jpg')
  )

kitty2 = Kitty.create!(
  goal_amount: 0,
  dream: dream2,
  private: false
  )


dream3 = Dream.create!(
  title: 'Being a photographer',
  description: 'Sed laeditur hic coetuum magnificus splendor levitate paucorum incondita, ubi nati sunt non reputantium, sed tamquam indulta licentia vitiis ad errores lapsorum ac lasciviam. ut enim Simonides lyricus docet, beate perfecta ratione vieturo ante alia patriam esse convenit gloriosam.',
  end_date: 2.months.from_now,
  reached: false,
  user: user2,
  category: "art",
  picture: File.open('app/assets/images/dream3.jpg')
  )

kitty3 = Kitty.create!(
  goal_amount: 200,
  dream: dream3,
  private: true
  )

dream4 = Dream.create!(
  title: 'My dream of nature',
  description: 'Sed laeditur hic coetuum magnificus splendor levitate paucorum incondita, ubi nati sunt non reputantium, sed tamquam indulta licentia vitiis ad errores lapsorum ac lasciviam. ut enim Simonides lyricus docet, beate perfecta ratione vieturo ante alia patriam esse convenit gloriosam.',
  end_date: 3.months.from_now,
  reached: false,
  user: user2,
  category: "adventure",
  picture: File.open('app/assets/images/dream4.jpg')
  )

kitty4 = Kitty.create!(
  goal_amount: 400,
  dream: dream4,
  private: false
  )

dream5 = Dream.create!(
  title: 'Learning a new language',
  description: 'Sed laeditur hic coetuum magnificus splendor levitate paucorum incondita, ubi nati sunt non reputantium, sed tamquam indulta licentia vitiis ad errores lapsorum ac lasciviam. ut enim Simonides lyricus docet, beate perfecta ratione vieturo ante alia patriam esse convenit gloriosam.',
  end_date: 2.years.from_now,
  reached: false,
  user: user2,
  category: "art",
  picture: File.open('app/assets/images/dream5.jpg')
  )

kitty5 = Kitty.create!(
  goal_amount: 0,
  dream: dream5,
  private: true
  )

dream6 = Dream.create!(
  title: 'Visiting Latin America',
  description: 'Sed laeditur hic coetuum magnificus splendor levitate paucorum incondita, ubi nati sunt non reputantium, sed tamquam indulta licentia vitiis ad errores lapsorum ac lasciviam. ut enim Simonides lyricus docet, beate perfecta ratione vieturo ante alia patriam esse convenit gloriosam.',
  end_date: 1.year.from_now,
  reached: false,
  user: user3,
  category: "travel",
  picture: File.open('app/assets/images/dream6.jpg')
  )

kitty6 = Kitty.create!(
  goal_amount: 500,
  dream: dream6,
  private: false
  )

dream7 = Dream.create!(
  title: 'Go to Antarctic!',
  description: 'Sed laeditur hic coetuum magnificus splendor levitate paucorum incondita, ubi nati sunt non reputantium, sed tamquam indulta licentia vitiis ad errores lapsorum ac lasciviam. ut enim Simonides lyricus docet, beate perfecta ratione vieturo ante alia patriam esse convenit gloriosam.',
  end_date: 2.years.from_now,
  reached: false,
  user: user4,
  category: "adventure",
  picture: File.open('app/assets/images/dream7.jpg')
  )

kitty7 = Kitty.create!(
  goal_amount: 600,
  dream: dream7,
  private: false
  )

dream8 = Dream.create!(
  title: 'Design my flat',
  description: 'Sed laeditur hic coetuum magnificus splendor levitate paucorum incondita, ubi nati sunt non reputantium, sed tamquam indulta licentia vitiis ad errores lapsorum ac lasciviam. ut enim Simonides lyricus docet, beate perfecta ratione vieturo ante alia patriam esse convenit gloriosam.',
  end_date: 1.month.from_now,
  reached: false,
  user: user4,
  category: "home",
  picture: File.open('app/assets/images/dream8.jpg')
  )

kitty8 = Kitty.create!(
  goal_amount: 400,
  dream: dream8,
  private: true
  )

dream9 = Dream.create!(
  title: 'Go visit my cousins',
  description: 'Sed laeditur hic coetuum magnificus splendor levitate paucorum incondita, ubi nati sunt non reputantium, sed tamquam indulta licentia vitiis ad errores lapsorum ac lasciviam. ut enim Simonides lyricus docet, beate perfecta ratione vieturo ante alia patriam esse convenit gloriosam.',
  end_date: 3.months.from_now,
  reached: false,
  user: user4,
  category: "travel",
  picture: File.open('app/assets/images/dream9.jpg')
  )

kitty9 = Kitty.create!(
  goal_amount: 500,
  dream: dream9,
  private: false
  )

dream10 = Dream.create!(
  title: 'Learn to dance Salsa',
  description: 'Sed laeditur hic coetuum magnificus splendor levitate paucorum incondita, ubi nati sunt non reputantium, sed tamquam indulta licentia vitiis ad errores lapsorum ac lasciviam. ut enim Simonides lyricus docet, beate perfecta ratione vieturo ante alia patriam esse convenit gloriosam.',
  end_date: 6.months.from_now,
  reached: false,
  user: user3,
  category: "sport",
  picture: File.open('app/assets/images/dream10.jpg')
  )

kitty10 = Kitty.create!(
  goal_amount: 200,
  dream: dream10,
  private: false
  )













