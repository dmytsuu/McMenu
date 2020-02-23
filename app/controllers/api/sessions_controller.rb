module Api
  class SessionsController < ApplicationController
    # def index
    #   render json: Product.all, each_serializer: ProductSerializer
    # end

    def create
      session = Session.create(session_params)
      response = session.errors.present? ? [session.errors.full_messages.to_sentence, 422] : [session, 201]
      render json: response[0], status: response[1]
    end

    def show
      session = Session.find(params.permit![:id])
      response = session.blank? ? ['Session not found', 422] : [session, 200]
      render json: response[0], status: response[1]
    end

    def session_params
      params.require(:session).permit(:id, :name, :private, :finish_at)
    end
  end
end
