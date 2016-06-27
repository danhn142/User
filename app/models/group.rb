class Group < ActiveRecord::Base
  belongs_to :user
  has_many :attendings, dependent: :destroy
  has_many :user_attendings, through: :attendings, source: :user 

  validates :name, :description, presence:true
  validates :name, :length => { minimum: 5 }
  validates :description, :length => { minimum: 10 }
  
end
