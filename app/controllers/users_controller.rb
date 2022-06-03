class UsersController < ApplicationController
  before_action :unavailable_request, only: %i[edit update destroy]
  before_action :check_current_user, only: %i[edit update destroy]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(params.require(:user).permit(:nickname, :email, :image))
      redirect_to user_path(@user)
    else
      flash[:error] = I18n.t("my.controllers.all.error")
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = I18n.t("my.controllers.users.destroy")
    redirect_to root_path
  end

  private

  def check_current_user
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:error] = I18n.t("my.controllers.all.error")
      redirect_to root_path
    end
  end
end
