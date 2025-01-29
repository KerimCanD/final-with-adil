class Api::V1::ApiController < ActionController::API
  include ActionController::RequestForgeryProtection
  SECRET_KEY = 'secret_key' # to-do: move to .env
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  # before_action :authenticate_user! # to-do : implement authentication on each step.

  private

  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    if token
      begin
        decoded_token = JWT.decode(token, SECRET_KEY, true, { algorithm: 'HS256' })
        user_id = decoded_token[0]['user_id']
        @current_user = User.find(user_id)
      rescue JWT::DecodeError, ActiveRecord::RecordNotFound
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    else
      render json: { error: 'Token missing' }, status: :unauthorized
    end
  end
end
