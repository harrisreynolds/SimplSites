class Api::V1::UsersController < Api::V1::BaseController

  skip_before_action :authenticate_with_token, only: [:dev_user]

  def dev_user
    if Rails.env.production?
      render json: {status: 'forbidden'}
      return
    end

    if User.count == 0
      render json: {status: 'error', message: 'You must create at least one user.'}
    else
      render json: User.first
    end
  end

end