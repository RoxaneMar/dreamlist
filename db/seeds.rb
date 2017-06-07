puts "destroying all data..."

Notification.destroy_all
Relationship.destroy_all
Contributor.destroy_all
Kitty.destroy_all
Like.destroy_all
Dream.destroy_all
User.destroy_all

puts "creating all data..."

arthur = User.create!(
  first_name: 'Arthur',
  last_name: 'Renaud',
  email: 'arthur@dreamlist.fr',
  password: 'password',
  avatar: File.open('app/assets/images/seeds/avatars/arthur.jpeg')
  )

etienne = User.create!(
  first_name: 'Etienne',
  last_name: 'Moreau',
  email: 'etienne@dreamlist.fr',
  password: 'password',
  avatar: File.open('app/assets/images/seeds/avatars/etienne.jpeg')
  )

mat = User.create!(
  first_name: 'Mathieu',
  last_name: 'Geiler',
  email: 'mat@dreamlist.fr',
  password: 'password',
  avatar: File.open('app/assets/images/seeds/avatars/mat.jpeg')
  )

kevin = User.create!(
  first_name: 'Kevin',
  last_name: 'Chavanne',
  email: 'kevin@dreamlist.fr',
  password: 'password',
  avatar: File.open('app/assets/images/seeds/avatars/kevin.jpeg')
  )

guillaume = User.create!(
  first_name: 'Guillaume',
  last_name: 'Crouillere',
  email: 'guillaume@dreamlist.fr',
  password: 'password',
  avatar: File.open('app/assets/images/seeds/avatars/guillaume_cr.jpeg')
  )

vanessa = User.create!(
  first_name: 'Vanessa',
  last_name: 'Loviton',
  email: 'vanessa@dreamlist.fr',
  password: 'password',
  avatar: File.open('app/assets/images/seeds/avatars/vanessa.jpeg')
  )


dream1 = Dream.create!(
  title: 'Travel to the end of the world',
  description: "As you all know I love walking in the mountains and be surrounded by beautiful landscapes.
  But with dreamlist I dare to finally try to realize one of my strongest dreams: do a 2 weeks trip in Antarctic to walk in never ending white landscapes and take time to think.
  I would need to be fully equiped and the trip is quite expensive, that's why I ask for your help. Thank you so much in advance and of course contact me with any questions. I can't wait !!!",
  end_date: 2.years.from_now,
  reached: false,
  user: etienne,
  category: "travel",
  picture: File.open('app/assets/images/seeds/dreams/antarctic.jpg')
  )

kitty1 = Kitty.create!(
  goal_amount: 900,
  dream: dream1,
  private: false
  )


dream2 = Dream.create!(
  title: 'Participate to a box championship',
  description: "I've never been part of a sport competition and I would love to do it.
  I discovered boxing a few months ago and this sport asks for a lot of discipline, work and will.
  I really would like to practice more this sport and my final goal would be be part of a real championship!!
  For that I would need equipment, to subscribe to a weekly class and of course to pay for the championship trip and all.
  I know it can sound crazy but I would be so proud of myself if I realized this dream and your support means a lot!
  Thanks so much",
  end_date: 1.year.from_now,
  reached: false,
  user: vanessa,
  category: "sport",
  picture: File.open('app/assets/images/seeds/dreams/box.jpg')
  )

kitty2 = Kitty.create!(
  goal_amount: 300,
  dream: dream2,
  private: false
  )


dream3 = Dream.create!(
  title: 'Learn to play piano',
  description: "I love music. I've always loved music really but the truth is I never really had the opportunity to learn to play an instrument when I was younger.
  It really is a difficult thing for me not to play music and even if I'm not a youngster anymore, I trully believe I still can learn.
  Piano is the most beautiful instrument for me and it's the one I want to play. But it's a real investment and I feel like if I don't put it as a dream I will never realize it.
  Buying a piano and subscribe to lessons are the simple steps that would help me realize my dream. I hope you can help, this would make me the happiest guy ever!!",
  end_date: 3.years.from_now,
  reached: false,
  user: arthur,
  category: "music",
  picture: File.open('app/assets/images/seeds/dreams/piano.jpg')
  )

kitty3 = Kitty.create!(
  goal_amount: 400,
  dream: dream3,
  private: false
  )

dream4 = Dream.create!(
  title: 'Live on a boat for a year',
  description: "Living on a boat has always been one of my dearest dreams. I always hoped I would do it one day and I think listing it is the best way to make it happen!
  Moving all the time, seeing new places, meeting new people, smelling the salt of the see in the morning.
  That would really be something! + no computer anymore, no internet connexion, no git hub, no rails and most of all: no students!",
  end_date: 4.years.from_now,
  reached: false,
  user: kevin,
  category: "home",
  picture: File.open('app/assets/images/seeds/dreams/boat.jpg')
  )

kitty4 = Kitty.create!(
  goal_amount: 20000,
  dream: dream4,
  private: true
  )

dream5 = Dream.create!(
  title: 'Learning Portuguese',
  description: "I don't feel complete speeking only french and english. Plus learning a new language sounds like a real challenge to me
  and it would help me do business and sign new contracts all around the world. Please like my dream if you think this is a good idea and contact me
    if your speak portuguese, I would definitely need some help to practice! Thanks",
  end_date: 2.years.from_now,
  reached: false,
  user: mat,
  category: "education",
  picture: File.open('app/assets/images/seeds/dreams/books.jpg')
  )

kitty5 = Kitty.create!(
  goal_amount: 0,
  dream: dream5,
  private: true
  )

dream6 = Dream.create!(
  title: 'Run New York half-marathon',
  description: "I love running, it's a great sport that helps you see beautiful landscapes and really empty your head.
  I ran several races already but the New Yor City marathon is a myth and I love New York too! Going there and participate
  to this race would make me really happy. I really can't wait!",
  end_date: 1.year.ago,
  reached: true,
  user: guillaume,
  category: "challenges",
  picture: File.open('app/assets/images/seeds/dreams/brooklyn_run.jpg')
  )

kitty6 = Kitty.create!(
  goal_amount: 1500,
  dream: dream6,
  private: false
  )

dream7 = Dream.create!(
  title: 'Have an iWatch',
  description: "I think it's finally time to switch to apple technologies. I've been fighting against it for years and now I can't stand it anymore.
  This watch is too gorgeous and I dream to wear it, that would be such a great gift. ",
  end_date: 6.months.from_now,
  reached: false,
  user: vanessa,
  category: "technology",
  picture: File.open('app/assets/images/seeds/dreams/iwatch.jpg')
  )

kitty7 = Kitty.create!(
  goal_amount: 400,
  dream: dream7,
  private: false
  )

dream8 = Dream.create!(
  title: 'Become a great photographer',
  description: "I plan to do several trips all around the world in the future and I love beautiful pictures.
  I never had a good camera and I think this would really help me try and start take great pictures.
  I would definitely practice more if I had a good camera I'm sure, and I would take great pictures of you all to thank you for your contribution :)",
  end_date: 1.month.from_now,
  reached: false,
  user: arthur,
  category: "art",
  picture: File.open('app/assets/images/seeds/dreams/photo.jpg')
  )

kitty8 = Kitty.create!(
  goal_amount: 500,
  dream: dream8,
  private: true
  )

dream9 = Dream.create!(
  title: 'Make a short film',
  description: "I love cinema and I would really like to make my own short film with friends in the countryside.
  I imagine something like a family scene with beautiful images and a lot of light.
  To do so I would need some equipment (that I would probably be able to borrow ) and some actors or friends who would like to have fun!
    Can't wait to realize this dream and to share my short film with you all. ",
  end_date: 6.months.from_now,
  reached: false,
  user: etienne,
  category: "cinema",
  picture: File.open('app/assets/images/seeds/dreams/food_weekend.jpg')
  )

kitty9 = Kitty.create!(
  goal_amount: 0,
  dream: dream9,
  private: true
  )

dream10 = Dream.create!(
  title: 'Camping in the forest with friends',
  description: "I would love to do a 2 weeks road trip in France with some friends. We would visit beautiful places and camp in the forest most of the nights.
  I already started to organize that trip but to make it come true I would need a lot of camping equipment which I don't have.
  I know I could borrow it but I think I will probably do that kind of trip again in the future and so if I could have this equipment as a gift,
     it could make me really happy and help me do a lot of adventurous trips with friends in the future.",
  end_date: 6.months.from_now,
  reached: false,
  user: mat,
  category: "adventure",
  picture: File.open('app/assets/images/seeds/dreams/camping.jpg')
  )

kitty10 = Kitty.create!(
  goal_amount: 400,
  dream: dream10,
  private: false
  )

dream11 = Dream.create!(
  title: "See a play at 'the cake' Opera",
  description: "The cake Opera just opened a few month ago and is really trendy. I am a really big fan of opera and would absolutely love to see a play there.
  If you're looking for a way to make me happy, this is really someting I would love to do.
  The sets look absolutely beautiful in the cake Opera. They spend a lot to make the scenery look real and it looks like it is a real exepriment to go there.",
  end_date: 6.months.from_now,
  reached: false,
  user: kevin,
  category: "culture",
  picture: File.open('app/assets/images/seeds/dreams/cake.jpg')
  )

kitty11 = Kitty.create!(
  goal_amount: 300,
  dream: dream11,
  private: false
  )

dream12 = Dream.create!(
  title: 'Plant a bio garden in my house',
  description: "Bio is really important to me. I know a lot of people think it's just a trend but it's not. It's far more than that.
  It's our future. I think even the fashion industry should be concerned about it! Anyway, I want to plant beautiful fruit trees in my house for several reasons:
  be able to eat bio food all the time and then influence my neighboors and friends. They need to see this is real and doable.
  I would be very happy if you could help me buy beautiful trees for my house. Thanks a lot in advance.",
  end_date: 6.months.from_now,
  reached: false,
  user: guillaume,
  category: "mode",
  picture: File.open('app/assets/images/seeds/dreams/japan_flowers.jpg')
  )

kitty12 = Kitty.create!(
  goal_amount: 400,
  dream: dream12,
  private: false
  )













