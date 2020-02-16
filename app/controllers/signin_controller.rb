class SigninController < ApplicationController
  before_action :authorize_access_request!, only: %i[destroy]

  def create
    user = User.find_by(email: params[:email])

    if user.authenticate(params[:password])
      payload = { user_id: user.id }
      jwt_session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true) # TODO: test just `payload` insdead of `payload: payload`
      tokens = jwt_session.login

      response.set_cookie(JWTSessions.access_cookie, value: tokens[:access],
                          httponly: true, secure: Rails.env.production?)

      render json: { csrf: tokens[:csrf] }
    else
      not_authorized
    end
  end

  def destroy
    jwt_session = JWTSessions::Session.new(payload: payload) # TODO: test just `payload` insdead of `payload: payload`
    jwt_session.flush_by_access_payload

    render json: :ok
  end

  private

  def user_params
    params.permit(:email, :password, :passwor_confirmation)
  end

  def not_found
    render json: { error: 'Cannot find a user' }, status: :not_found
  end
end
