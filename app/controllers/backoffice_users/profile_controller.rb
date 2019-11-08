class BackofficeUsers::ProfileController < BackofficeUsersController
  before_action :set_user, only: [:new, :edit, :update]
  before_action :verify_password, only: [:update]
  
  def new
  end

  def edit
  end

  def update
    if @user.update(params_user)
      bypass_sign_in(@user)
      render :edit, notice: "Os dados foram salvos!"
    else
      render :edit, notice: "sometinhg wrong!"
    end
  end

  def create
    @user = User.new(params_user)
      if @user.save
        redirect_to "#", notice: "#{@user.full_name} seus dados foram salvos, efetue o pagto para concluir a adesão."
      else
        render :new, notice: "Complete seus dados."
      end
    end


  private

  def set_user
    @user = User.find(current_user.id)
  end

  def params_user
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def verify_password
    if params[:user] [:password].blank? && params[:user] [:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end
end
