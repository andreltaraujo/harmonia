class Users::SessionsController < Devise::SessionsController
  
  protected
    def after_sign_in_path_for(resource)
      @user.user_profile.blank? ? backoffice_users_profile_path : backoffice_users_profile_index_path
    end
end