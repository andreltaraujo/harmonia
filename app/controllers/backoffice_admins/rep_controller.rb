class BackofficeAdmins::RepController < BackofficeAdminsController
  def index
    @reps = Representative.all
  end
end
