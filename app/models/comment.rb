class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable

  validates :description, presence: true
  validates :user_id, presence: true
  validates :commentable, presence: true

  def vote_count
    upvotes = self.votes.where(up_down: 1)
    downvotes = self.votes.where(up_down: -1)
    upvotes.length - downvotes.length

  end
end
