class BackofficeAdmins::AdminsController < BackofficeAdminsController
  def index
    @admins = Admin.all
  end
end
