class Product < ApplicationRecord
  field :name, type: String
  field :kind, type: String
  field :price, type: Integer
  field :image, type: String

  has_many :bucket_products

  def buckets
    Bucket.in(id: bucket_products.pluck(:bucket_id))
  end
end
