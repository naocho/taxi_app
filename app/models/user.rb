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
  validates :password ,      format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,100}+\z/, message: '半角英数字混合で8文字以上使用してください'}
  end
end

