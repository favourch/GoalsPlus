class Stadium < ActiveRecord::Base
  belongs_to :city
  has_many :teams
  has_many :matches


  accepts_nested_attributes_for :teams, :matches
end
