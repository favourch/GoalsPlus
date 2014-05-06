class Team < ActiveRecord::Base
  belongs_to :stadium
  has_many :matches
  has_one :setting

end
