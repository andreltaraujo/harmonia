class BackofficeAdmins::ContractsController < BackofficeAdminsController
  def index
    @contracts = Contract.all
  end
end
