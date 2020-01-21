class Product
  include Mongoid::Document
  field :name, type: String
  field :kind, type: String
  field :price, type: Integer
  field :image, type: String
end
