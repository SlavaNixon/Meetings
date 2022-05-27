class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def destroy
    @user = User.find(params[:id])
    @user.meeting.destroy_all
    @user.destroy
    flash[:success] = 'Ваш аккаунт успешно удален.'
    redirect_to root_path
  end
end
