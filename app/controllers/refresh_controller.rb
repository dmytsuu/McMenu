class RefreshController < ApplicationController
  before_action :authorize_refresh_by_access_request!

  def create
    jwt_session = JWTSessions::Session.new(payload: claimless_payload, refresh_by_access_allowed: true)
    tokens  = jwt_session.refresh_by_access_allowed do
      raise JWTSessions::Errors::Unauthorized, 'Something not right here!'
    end

    response.set_cookie(JWTSessions.access_cookie, value: tokens[:access], httponly: true, secure: Rails.env.production?)

    render json: { csrf: tokens[:csrf] }
  end
end
