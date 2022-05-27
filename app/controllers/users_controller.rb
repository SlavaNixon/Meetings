class UsersController < ApplicationController
  before_action :unavailable_request, only: %i[edit update destroy]
  before_action :check_current_user, only: %i[edit update destroy]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(params.require(:user).permit(:nickname, :email))
      redirect_to user_path(@user)
    else
      flash[:error] = 'Что-то пошло не так.'
      render :edit
    end
  end

  def destroy
    @user.meeting.destroy_all
    @user.destroy
    flash[:success] = 'Ваш аккаунт успешно удален.'
    redirect_to root_path
  end

  private

  def check_current_user
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:error] = 'Что-то пошло не так.'
      redirect_to root_path
    end
  end
end
