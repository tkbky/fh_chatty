class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to channels_path, notice: 'Welcome!'
    else
      flash[:error] = 'Something is wrong!'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Signed out!'
  end
end
