class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  def self.top_25
    #Question.all[0..25]
    Question.all
  end

  def vote_count
    upvotes = self.votes.where(up_down: 1)
    downvotes = self.votes.where(up_down: -1)
    upvotes.length - downvotes.length
  end

  def answer_count
    self.answers.length
  end

end
