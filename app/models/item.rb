class Item < ApplicationRecord
  has_one_attached :image

  validates :id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :is_active, presence: true

  def get_image
    if image.attached?
      image
    end
  end

end
