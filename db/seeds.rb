# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: "test@test.com",
  password: "Secret",
  password_confirmation: "Secret",
  name: "Amin User",
  roles: "site_admin"
)

puts "1 Admin User created"

User.create!(
  email: "guest@test.com",
  password: "Secret",
  password_confirmation: "Secret",
  name: "Regular User"
)

puts "1 Regular User created"

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

puts "3 topics created"

10.times do |blog|
  Blog.create!(
    title: "My Blog Post Numero #{blog}",
    body: "Lorem ipsum dolor amet ugh hashtag banjo cred YOLO asymmetrical bicycle rights man bun normcore hot chicken irony kickstarter. Drinking vinegar fingerstache schlitz thundercats activated charcoal raw denim iceland copper mug. Dreamcatcher roof party humblebrag jianbing, succulents microdosing tousled portland. Roof party aesthetic whatever occupy, kale chips fashion axe slow-carb unicorn. 3 wolf moon poutine prism pok pok.",
    topic_id: Topic.last.id
    )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts "5 skills created"

8.times do |portfolio|
  Portfolio.create!(
    title: "Portfolio title #{portfolio}",
    subtitle: "Ruby on Rails",
    body: "Efficiently unleash cross-media information without cross-media value. Quickly maximize timely deliverables for real-time schemas. Dramatically maintain clicks-and-mortar solutions without functional solutions.",
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x200"
  )
end

1.times do |portfolio|
  Portfolio.create!(
    title: "Portfolio title #{portfolio}",
    subtitle: "Angular",
    body: "Efficiently unleash cross-media information without cross-media value. Quickly maximize timely deliverables for real-time schemas. Dramatically maintain clicks-and-mortar solutions without functional solutions.",
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x200"
  )
end

puts "9 portfolio items created"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts "3 technologies created"
