# frozen_string_literal: true

module Authenticate
  extend ActiveSupport::Concern

  included do
    before_action :validate_user
  end

  private

  def auth_token
    request.headers['Authorization'] ||= params['Authorization']
  end

  def validate_user
    begin
      decoded = JsonWebToken.decode(auth_token)
      @current_user = User.find(decoded[:user_id])
      User.current = @current_user
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: 'Unauthorised or invalid auth token' }, status: :unauthorized
    rescue JWT::ExpiredSignature => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::ImmatureSignature
      render json: { errors: 'Invalid or malafide access token' }, status: :unauthorized
    end
  end
end


