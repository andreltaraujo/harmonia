class BackofficeUsers::ProfileController < BackofficeUsersController
  before_action :set_user, only: [:index, :edit, :update]
  before_action :verify_password, only: [:update]
  
  def index
  end
  
  def edit
  end

  def update
    if @user.update(params_user)
      bypass_sign_in(@user)
      redirect_to backoffice_users_profile_index_path, notice: "Os dados foram salvos!"
    else
      render :edit, notice: "sometinhg wrong!"
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def params_user
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
    user_profile_attributes:[:id, :birthdate, :cpf, :rg, :mar_status, :secretary, :entity],
    home_address_attributes: [:id, :street, :number, :district, :city, :state, :cep],
    business_address_attributes: [:id, :street, :number, :district, :city, :state, :cep],
    phones_attributes: [:id, :phone_number],
    bank_info_attributes: [:id, :bank_name, :bank_number, :agency_number, :account_number, :debit_date],
    dependents_attributes: [:id, :name, :birthdate, :kinship, :_destroy])
  end

  def verify_password
    if params[:user] [:password].blank? && params[:user] [:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end
end
