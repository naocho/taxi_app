class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :taxis
  has_many :comments

  with_options presence: true do 
  validates :nickname
  validates :email,                    format: { with: /\A.+@.+\z/, message: '@を含めてください'}
  validates :password,                 format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/, message: '半角英数字混合で6文字以上使用してください'}
  end
end

