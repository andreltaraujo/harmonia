class BackofficeUsersController < ApplicationController
  before_action :authenticate_user!
  layout 'backoffice_users'
end
