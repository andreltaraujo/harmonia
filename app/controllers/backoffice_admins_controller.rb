class BackofficeAdminsController < ApplicationController
  before_action :authenticate_admin!
  layout 'backoffice_admins'
end
