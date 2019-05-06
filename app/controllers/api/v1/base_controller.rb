class Api::V1::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_with_token

  def authenticate_with_token
    @current_user = User.find_by_auth_token(request.headers['x-api-token'])

    unless @current_user
      render status: :unauthorized, json: {error: 'Invalid Credentials'}
      return false
    end

    true
  end
end
