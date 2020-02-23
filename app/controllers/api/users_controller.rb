module Api
  class UsersController < ApplicationController
    def create
      user = User.create(user_params)
      render json: user, status: 201
    end

    def user_params
      params.require(:user).permit(:name)
    end
  end
end
