class BackofficeUsers::ProfileController < BackofficeUsersController
  before_action :set_user, only: [:index, :edit, :update]
  before_action :verify_password, only: [:update]
  
  def index
    @users = User.all
  end
  
  def edit
    @user.build_user_profile if @user.user_profile.blank?
    @user.build_home_address if @user.home_address.blank?
    @user.build_business_address if @user.business_address.blank?
    @user.build_bank_info if @user.bank_info.blank?
    @user.phones.build if @user.phones.blank?
    @user.dependents.build if @user.dependents.blank?
  end

  def update
    if @user.update(params_user)
      bypass_sign_in(@user)
      redirect_to checkout_payments_path, notice: "Seus dados foram salvos. Confira e prossiga para o pagamento!"
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
