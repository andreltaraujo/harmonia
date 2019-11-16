class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_params, if: :devise_controller?

  protected
    def after_sign_up_path_for(resource)
      backoffice_users_welcome_path
    end

    def set_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

end