class Order < ApplicationRecord
  belongs_to :user
  has_many :carts
  has_many :products, through: :carts

  def total_price
    products.sum(:price)
  end
end
