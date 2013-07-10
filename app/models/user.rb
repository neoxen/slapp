class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :account
  has_many :orders

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  validates :username, :uniqueness => { :case_sensitive => false }

end
