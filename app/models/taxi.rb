class Taxi < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  with_options presence: true do
    validates :image    
    validates :departure,               format: { with: /(https?|ftp)(:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)/, message: 'ちゃんとURLを入力してください。'}
    validates :arrival,                 format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'コメントは9文字ま'}
    validates :title,                   format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'タイトルは7文字まで'}
    validates :text,                    format: { with: /[ぁ-んァ-ン一-龥]{0,100}/} 
  end

  def self.search(search)
    if search != ""
      Taxi.where('title LIKE(?)', "%#{search}%")
    else
      Taxi.all
    end
  end
end
