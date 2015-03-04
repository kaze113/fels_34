# Users
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password:              password,
              password_confirmation: password)
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

#categories
5.times do
  title = Faker::Lorem.sentence(3)
  intro = Faker::Lorem.sentence(10)
  Category.create!(title: title, intro: intro) 
end

#words
categories = Category.all
50.times do
  categories.each { |category|
    content = Faker::Lorem.characters(8) 
    category.words.create(content: content)
  }
end

#definitions
words = Word.all 
words.each { |word| 
  word_def = Faker::Lorem.characters(8)
  word.definitions.create(word_def: word_def, 
                          value: true)
  3.times do
    word_def = Faker::Lorem.characters(8)
    word.definitions.create(word_def: word_def)
  end  
}

#lessons
users = User.all
categories = Category.all
categories = categories[1..3]
students = users[0..5]
students.each { |student|
  categories.each { |category|
    student.lessons.create(category_id: category.id)
  }
}

#results
lessons = Lesson.all
lessons.each { |lesson|
  category = Category.find lesson.category_id
  words = category.words
  learneds = words[1..5]
  learneds.each { |learned|
    ids = lesson.word_ids + " " + learned.id.to_s
    lesson.update_attributes word_ids: ids 
    definition_id = learned.definitions.first.id
    lesson.results.create(word_id: learned.id, 
                          definition_id: definition_id)
  } 
}