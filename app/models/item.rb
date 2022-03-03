class Item < ApplicationRecord
  before_save :truncate_price

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  def truncate_price
    format('%.2f', price)
  end
end
