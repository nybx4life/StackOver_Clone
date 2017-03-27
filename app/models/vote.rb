class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :voteable, polymorphic: true


  validates :user_id, presence: true
  validates :up_down, presence: true
  validates :voteable, presence: true
end
