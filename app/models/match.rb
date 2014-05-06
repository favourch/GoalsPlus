class Match < ActiveRecord::Base
  belongs_to :team_a, :class_name => 'Team'
  belongs_to :team_b, :class_name => 'Team'
  belongs_to :stadium
  belongs_to :tournament
  belongs_to :stage
  belongs_to :timezone
  has_many :guesses


  accepts_nested_attributes_for :stadium


end
