class Team < ActiveRecord::Base
  belongs_to :stadium
  has_many :matches
  has_one :setting

  accepts_nested_attributes_for :matches, :setting

end
