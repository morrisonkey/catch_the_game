class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :fan
  has_many :venues
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
