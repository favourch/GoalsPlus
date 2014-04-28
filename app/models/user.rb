class User < ActiveRecord::Base
  belongs_to  :setting
  has_one :guess

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable#, :validatable

  validates_presence_of :user_name



end
