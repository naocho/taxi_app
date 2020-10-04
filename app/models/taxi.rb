class Taxi < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  def self.search(search)
    if search != ""
      Taxi.where('text LIKE(?)', "%#{search}%")
    else
      Taxi.all
    end
  end
end
