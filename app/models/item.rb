class Item < ApplicationRecord
  before_save :truncate_price

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }


  def truncate_price
    price.to_f.round(2)
  end
end
