class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :kind, :price

  def kind
    object[:kind].titleize
  end
end
