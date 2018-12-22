class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :authorize]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome!"
      redirect_to root_url
    elsif User.exists?(email: params[:user][:email].downcase)
      flash[:error] = "A user with that email already exists."
      render 'new'
    else
      flash[:error] = "Something went wrong, try again!"
      render 'new'
    end
  end

  def edit
    head :forbidden unless authorize
  end

  def update
    head :forbidden unless authorize
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def authorize
      current_user?(@user) || current_user.admin?
    end
end
