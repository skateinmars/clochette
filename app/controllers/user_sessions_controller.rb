class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to root_path, notice: t('.success')
    else
      flash.now[:alert] = t('.invalid')
      render action: "new"
    end
  end

  def destroy
    logout

    redirect_to login_path, notice: t('.success')
  end
end
