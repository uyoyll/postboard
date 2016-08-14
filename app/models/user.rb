class User < ActiveRecord:: Base
	has_many :posts
	has_many :comments

  #Rails 內建的使用者認證功能 false是避免使用者需要輸入密碼兩次
  has_secure_password validations: false 
  
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}

end