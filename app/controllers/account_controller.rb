class AccountController < ApplicationController
  before_action :authenticate_user!

  def index

    if current_user.stripe_subscription_id.present?
      @subscription = CreditCardService.new(current_user).current_subscription
    end

  end
end
