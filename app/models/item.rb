class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :order_detail

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :is_active, presence: true

  def get_image
    if image.attached?
      image
    end
  end
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  def subtotal
    item.with_tax_price * amount
  end

end
