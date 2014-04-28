class City < ActiveRecord::Base
  belongs_to :country
  belongs_to :timezone
  has_many :stadiums
  has_many :teams
end
