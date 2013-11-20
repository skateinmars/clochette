class UsersController < ApplicationController
  before_action :load_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = t('.success')
      redirect_to users_url
    else
      flash.now[:notice] = t('.invalid')
      render action: 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = t('.success')
      redirect_to users_url
    else
      flash.now[:notice] = t('.invalid')
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy

    flash[:notice] = t('.success')
    redirect_to users_url
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
