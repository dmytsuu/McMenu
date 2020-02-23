class Bucket < ApplicationRecord
  belongs_to :user
  belongs_to :session
  has_many :bucket_products

  def products
    Product.in(id: bucket_products.pluck(:product_id))
  end
end
