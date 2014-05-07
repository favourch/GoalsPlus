class Setting < ActiveRecord::Base
  has_one :user
  belongs_to :timezone
  belongs_to :role
  belongs_to :team
  belongs_to :language


  accepts_nested_attributes_for :user
end
