class BackofficeAdmins::UsersController < BackofficeAdminsController
  def index
    @users = User.all
  end
end
