class Role < ActiveRecord::Base
  has_many :setting

  accepts_nested_attributes_for :setting
end
