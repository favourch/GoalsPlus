class Guess < ActiveRecord::Base
  belongs_to :user
  belongs_to :match



  validates_uniqueness_of :user_id, scope: :match_id, message: 'You already guessed this match'
  validates_presence_of :goals_b, :goals_a, message: 'You must enter the score'
  validates :goals_b, :goals_a, numericality: { only_integer: true, :greater_than => 0 }

end
