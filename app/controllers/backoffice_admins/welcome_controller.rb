class BackofficeAdmins::WelcomeController < BackofficeAdminsController
  def index
    @contracts = Contract.all
    @admins = Admin.all
    @reps = Representative.all
  end
end
