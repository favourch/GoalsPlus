class City < ActiveRecord::Base
  belongs_to :country
  belongs_to :timezone
  has_many :stadiums
  has_many :teams

  accepts_nested_attributes_for :stadiums, :teams

end
