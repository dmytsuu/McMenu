class ProductsController < ApplicationController
  def index
    render json: Product.all, each_serializer: ProductSerializer
  end
end
