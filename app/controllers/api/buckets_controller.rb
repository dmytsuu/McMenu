module Api
  class BucketsController < ApplicationController
    # TODO: refactor this shit
    def create
      bucket = Bucket.create(user_id: params[:user_id])
      records = []
      params['products'].each do |product|
        records << BucketProduct.create(product_id: product['id'], bucket: bucket, quantity: product['quantity'])
      end
      status = records.present? ? 201 : 422
      render json: {}, status: status
    end
  end
end
