class BucketProduct
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  field :quantity, type: Integer

  belongs_to :product
  belongs_to :bucket
end
