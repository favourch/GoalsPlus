class Stadium < ActiveRecord::Base
  belongs_to :city
  has_many :teams
  has_many :matches
end
