class RegistrationsController < ApplicationController
  before_action :require_login, only: :edit
  before_action :prepare_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to channels_path, notice: 'Welcome!'
    else
      flash[:error] = 'Something is wrong!'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to channels_path, notice: 'Update successful!'
    else
      flash[:error] = 'Something is wrong!'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :email, :password, :password_confirmation
  end

  def prepare_user
    @user = User.find params[:id]
  end
end
