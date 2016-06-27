class User < ActiveRecord::Base
  has_secure_password
  has_many :groups
  has_many :attendings, dependent: :destroy  
  has_many :group_attendings, through: :attendings, source: :group

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, presence:true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
