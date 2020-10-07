class Taxi < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  with_options presence: true do
    validates :image    
    validates :departure,    format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください'}
    validates :arrival,      format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください'}
    validates :title
    validates :text
  end

  def self.search(search)
    if search != ""
      Taxi.where('departure LIKE(?)', "%#{search}%")
    else
      Taxi.all
    end
  end
end
