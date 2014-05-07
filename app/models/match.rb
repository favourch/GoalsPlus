class Match < ActiveRecord::Base
  belongs_to :host, :class_name => 'Team'
  belongs_to :visitor, :class_name => 'Team'
  belongs_to :stadium
  belongs_to :tournament
  belongs_to :stage
  belongs_to :timezone
  has_many :guesses

  accepts_nested_attributes_for :guesses

end
