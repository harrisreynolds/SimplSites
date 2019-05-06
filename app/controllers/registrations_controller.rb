class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :configure_permitted_parameters, only: [:create]
  layout 'devise'

  # def create
  #   super
  # end
  #
  # def new
  #   super
  # end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
  end

end