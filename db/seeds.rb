

#Create 20 users
20.times do
  User.create!(
    :username => Faker::Pokemon.name,
    :email => Faker::Internet.email,
    :password => 'Password')
end


#Create 20 questions
20.times do |question|
    Question.create!(
              :title => Faker::Book.title,
              :description => Faker::Lorem.sentence,
              :user_id => rand(20)+1)
end


#create 50 answers to random questions

50.times do

  answer = Answer.create!(
      :description => Faker::ChuckNorris.fact,
      :user_id => rand(20)+1,
      :question_id => rand(20)+1,
      :chosen_answer => false)

end

#create 50 comments to random questions
50.times do
    Comment.create!(
          :description => Faker::Cat.registry,
          :user_id => rand(20)+1,
          :commentable_id => rand(20)+1,
          :commentable_type => "Question")
end

#Create 50 comments to random answers
50.times do
    Comment.create!(
          :description => Faker::Cat.registry,
          :user_id => rand(20)+1,
          :commentable_id => rand(50)+1,
          :commentable_type => "Answer")
end

#Create 200 random votes to questions
200.times do
  Vote.create!(:up_down => [1,-1].sample,
                 :user_id => rand(20),
                 :voteable_type => "Question",
                 :voteable_id => rand(20)+1)
end

#Create 200 random votes to answers
200.times do
  Vote.create!(:up_down => [1,-1].sample,
                 :user_id => rand(20),
                 :voteable_type => "Answer",
                 :voteable_id => rand(50)+1)
end
#Create 400 random votes to comments
400.times do
  Vote.create!(:up_down => [1,-1].sample,
                 :user_id => rand(20),
                 :voteable_type => "Comment",
                 :voteable_id => rand(100)+1)
end
