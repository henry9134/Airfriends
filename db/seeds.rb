require 'open-uri'

Rental.destroy_all
Activity.destroy_all
User.destroy_all

users = [
  {
    name: "Elon Musk",
    email: "elon@example.com",
    password: "password123",
    description: "CEO of SpaceX and Tesla, known for his work in technology and space exploration.",
    location: "Shibuya",
    age: 52,
    gender: "Male",
    image_url: "https://i.guim.co.uk/img/media/c90cd76198cbe0330c5e379b20cfa5c5fac9664a/0_157_4742_2847/master/4742.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=6368cd6cb3a248ba13a21bc8e553be95",
    activities: [
      { name: "SpaceX Launch Experience", price: 500, description: "Join a simulated launch experience with SpaceX technology." },
      { name: "Tesla Test Drive", price: 100, description: "Test drive the latest Tesla models and experience electric driving." },
      { name: "Mars Colonization Workshop", price: 300, description: "Learn about the future of space travel and colonization." }
    ]
  },
  {
    name: "Travis Scott",
    email: "travis@example.com",
    password: "password123",
    description: "Award-winning rapper and producer known for his innovative sound and energetic performances.",
    location: "Roppongi",
    age: 31,
    gender: "Male",
    image_url: "https://media.npr.org/assets/img/2021/11/16/gettyimages-1235223332_sq-e88ad790d447bd7dfcb0c1571047db26d39a8ee0.jpg?s=1100&c=85&f=jpeg",
    activities: [
      { name: "Astroworld Festival Experience", price: 300, description: "Join Travis Scott at his annual music festival." },
      { name: "Recording Session", price: 1000, description: "Get a behind-the-scenes look at a recording session with Travis." },
      { name: "Merchandise Design Workshop", price: 200, description: "Learn about merchandise design inspired by Travis's brand." }
    ]
  },
  # {
  #   name: "Will Vanderwyden",
  #   email: "will@example.com",
  #   password: "password123",
  #   description: "Phatest arrow in Le Wagon, aspiring dodgeball god.",
  #   location: "Shinjuku",
  #   age: 18,
  #   gender: "Male",
  #   image_url: "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBNUNNQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--b1853a1231b8914d08d5cffc2d87feab281d69d3/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/great%20me.jpg",
  #   activities: [
  #     { name: "Dodgeball masterclass", price: 10000, description: "Learn dodgeball from Will Vanderwyden." },
  #     { name: "Squeeky chair workshop", price: 5000, description: "Learn how to use a squeeky chair from Will Vanderwyden." },
  #     { name: "Private dance lesson", price: 12000, description: "Get access to a private dance lesson with Will Vanderwyden." }
  #   ]
  # },
  {
    name: "Dwayne Johnson",
    email: "dwayne@example.com",
    password: "password123",
    description: "Actor and former professional wrestler, known as 'The Rock'.",
    location: "Shibuya",
    age: 51,
    gender: "Male",
    image_url: "https://hips.hearstapps.com/hmg-prod/images/gettyimages-1061959920.jpg",
    activities: [
      { name: "Wrestling Training Camp", price: 150, description: "Train with Dwayne Johnson and learn wrestling techniques." },
      { name: "Hollywood Acting Workshop", price: 250, description: "Get acting tips from a Hollywood star." },
      { name: "Fitness Bootcamp", price: 200, description: "Join a fitness bootcamp led by Dwayne Johnson." }
    ]
  },
  {
    name: "Kanye West",
    email: "ye@example.com",
    password: "password123",
    description: "Award-winning singer-songwriter known for his narrative songwriting.",
    location: "Harajuku",
    age: 34,
    gender: "Male",
    image_url: "https://s.abcnews.com/images/GMA/kanye-west-gty-gmh-221026_1666796669383_hpMain_1x1_992.jpg",
    activities: [
      { name: "Music Production Class", price: 300, description: "Learn music production techniques from Kanye West." },
      { name: "Songwriting Retreat", price: 150, description: "Collaborate on songwriting with industry professionals." },
      { name: "Fashion Design Workshop", price: 200, description: "Explore fashion design inspired by Kanye's creativity." }
    ]
  },
  {
    name: "Barack Obama",
    email: "obama@example.com",
    password: "password123",
    description: "44th President of the United States and author.",
    location: "Chiyoda",
    age: 62,
    gender: "Male",
    image_url: "https://www.whitehouse.gov/wp-content/uploads/2021/01/44_barack_obama.jpg",
    activities: [
      { name: "Presidential Leadership Forum", price: 400, description: "Gain insights into leadership from Barack Obama." },
      { name: "Community Service Day", price: 100, description: "Participate in community service projects with Obama." },
      { name: "Book Writing Workshop", price: 250, description: "Learn the art of writing from a bestselling author." }
    ]
  },
  {
    name: "Beyoncé",
    email: "beyonce@example.com",
    password: "password123",
    description: "Global music icon and philanthropist known for her powerful voice and performances.",
    location: "Shibuya",
    age: 42,
    gender: "Female",
    image_url: "https://media.glamour.com/photos/66268d8a8aefb9b182da343a/1:1/w_1564,h_1564,c_limit/Beyonce%CC%81%20Just%20Dropped%20Her%20Hair%20Care%20Routine%20and%20Shut%20Down%20Wig%20%20%E2%80%98Misconceptions%E2%80%99.jpg",
    activities: [
      { name: "Vocal Masterclass", price: 200, description: "Hone your singing skills with Beyoncé." },
      { name: "Philanthropy Workshop", price: 150, description: "Learn about philanthropy and social impact from Beyoncé." },
      { name: "Dance Class", price: 100, description: "Take a dance class inspired by Beyoncé's performances." }
    ]
  },
  {
    name: "Bill Gates",
    email: "gates@example.com",
    password: "password123",
    description: "Co-founder of Microsoft and philanthropist focused on global health and education.",
    location: "Minato",
    age: 67,
    gender: "Male",
    image_url: "https://yt3.googleusercontent.com/WuPodYLA22bumFSAnf654wJ8cE7n2Zb8M2KEF5B3RiyziqLTXQpp6JXBYOSH8zifY_jihWVq=s900-c-k-c0x00ffffff-no-rj",
    activities: [
      { name: "Tech for Good Conference", price: 300, description: "Explore technology's role in global health with Bill Gates." },
      { name: "Global Health Workshop", price: 200, description: "Discuss global health challenges and solutions." },
      { name: "Entrepreneurship Seminar", price: 150, description: "Learn about entrepreneurship from a tech pioneer." }
    ]
  },
  {
    name: "Rihanna",
    email: "rihanna@example.com",
    password: "password123",
    description: "Singer, actress, and businesswoman known for her music and Fenty Beauty line.",
    location: "Shibuya",
    age: 35,
    gender: "Female",
    image_url: "https://media.vogue.fr/photos/66c2ee8c3b858e57148158b2/1:1/w_2903,h_2903,c_limit/JDR-Or_Crop_Centre_DP-1.jpg",
    activities: []
  },
  {
    name: "Jeff Bezos",
    email: "bezos@example.com",
    password: "password123",
    description: "Founder of Amazon and space exploration company Blue Origin.",
    location: "Minato",
    age: 59,
    gender: "Male",
    image_url: "https://media.gqmagazine.fr/photos/5f44c00103a812dcf4928d62/1:1/w_2000,h_2000,c_limit/JEFF.jpg",
    activities: [
      { name: "E-commerce Strategy Session", price: 300, description: "Learn about e-commerce strategies from Jeff Bezos." },
      { name: "Space Exploration Workshop", price: 200, description: "Discuss the future of space exploration with Bezos." }
    ]
  },
  {
    name: "Corinna Kopf",
    email: "corinna@example.com",
    password: "password123",
    description: "Social media influencer and content creator known for her engaging personality and lifestyle content.",
    location: "Meguro",
    age: 27,
    gender: "Female",
    image_url: "https://thespun.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cq_auto:good%2Cw_1200/MjEwMjE2MTc5MjEyNDk0MDI4/screenshot-2024-10-24-at-41422-pm.png",
    activities: [
      { name: "Content Creation Workshop", price: 150, description: "Learn the art of content creation with Corinna Kopf." },
      { name: "Social Media Strategy Seminar", price: 200, description: "Explore effective social media strategies." },
      { name: "Influencer Marketing Workshop", price: 250, description: "Understand the dynamics of influencer marketing." }
    ]
  },
  {
    name: "Dua Lipa",
    email: "dua@example.com",
    password: "password123",
    description: "English singer and songwriter known for her pop hits and powerful vocals.",
    location: "Shibuya",
    age: 28,
    gender: "Female",
    image_url: "https://media.vogue.fr/photos/65c0bfa21bec1a1404347808/1:1/w_2389,h_2389,c_limit/1986905569",
    activities: [
      { name: "Pop Music Masterclass", price: 250, description: "Learn the art of pop music from Dua Lipa." },
      { name: "Dance Choreography Workshop", price: 200, description: "Create and learn dance routines inspired by Dua Lipa's hits." },
      { name: "Fashion and Music Fusion Event", price: 300, description: "Explore the intersection of fashion and music with Dua Lipa." }
    ]
  },
  {
    name: "Kylian Mbappé",
    email: "mbappe@example.com",
    password: "password123",
    description: "Professional footballer known for his speed and skill on the field.",
    location: "Shibuya",
    age: 24,
    gender: "Male",
    image_url: "https://assets-fr.imgfoot.com/media/cache/1200x1200/bappevsallemagne.jpg",
    activities: [
      { name: "Football Skills Training", price: 150, description: "Enhance your football skills with Kylian Mbappé." },
      { name: "World Cup Experience", price: 500, description: "Join Kylian Mbappé for an exclusive World Cup experience." },
      { name: "Youth Football Camp", price: 200, description: "Participate in a football camp focused on youth development with Mbappé." }
    ]
  }
]

users.each do |user_hash|
  user = User.new(user_hash.except(:activities))
  image = user_hash[:image_url]
  p image
  file = URI.open(image)
  user.photo.attach(io: file, filename: "#{user.name}.jpg")
  user_hash[:activities].each do |activity_hash|
    activity = Activity.new(activity_hash)
    activity.user = user
    activity.save
  end
  user.save
end

User.all.each do |user|
  new_user = User.where.not(id: user).sample
  activity = new_user.activities.sample
  booking_date = Date.today + rand(1..30).days
  Rental.create(user: user, activity: activity, booking_date: booking_date)
end

puts "Seeds completed successfully!"
