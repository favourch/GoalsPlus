class Team < ActiveRecord::Base
  belongs_to :stadium
  has_many :matches
  has_one :settings

  accepts_nested_attributes_for :matches, :settings

end
