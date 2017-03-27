class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def people_reached
    vote_count(self.questions) + vote_count(self.answers) + vote_count(self.comments) + answer_count(self.questions) + comment_count(self.questions) + comment_count(self.answers)
  end

  def questions_answers
    self.questions + self.answers
  end

  private
    def vote_count(posts)
      voters = posts.each do |post|
        post.votes.map do |vote|
          vote.user unless vote.user == self
        end
      end
      voters.uniq.length
    end

    def comment_count(posts)
      responders = posts.each do |post|
        post.comments.map do |comment|
          comment.user unless comment.user == self
        end
      end
      responders.uniq.length
    end

    def answer_count(posts)
      responders = posts.each do |post|
        post.answers.map do |answer|
          answer.user unless answer.user == self
        end
      end
      responders.uniq.length
    end

end
