class BucketsController < ApplicationController
  def create
    bucket = Bucket.create
    params['_json'].each do |product|
      BucketProduct.create(product_id: product['id'], bucket: bucket, quantity: product['quantity'])
    end

    render json: {}, status: 201
  end
end
