class Bucket
  include Mongoid::Document

  has_many :bucket_products

  def products
    Product.in(id: bucket_products.pluck(:product_id))
  end
end
