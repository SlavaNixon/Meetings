class MeetingsController < ApplicationController
  before_action :unavailable_request, only: %i[new edit destroy create update]
  before_action :check_current_user, only: %i[edit update destroy]

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    flash[:success] = 'Успешно удаленно.'
    redirect_to root_path
  end

  def edit
    
  end

  def update
    if @meeting.update(params.require(:meeting).permit(:name, :place, :date))
      redirect_to meeting_path(@meeting)
    else
      flash[:error] = 'Что-то пошло не так.'
      render :edit
    end
  end

  def new
  end

  def create
    @meeting = Meeting.new(name: params[:name], place: params[:place],
      date: params[:date], description: params[:description], user: current_user)
    if @meeting.save
      flash[:success] = 'Сохраннено.'
      redirect_to root_path
    end
  end

  def index
    @meeting = Meeting.order(:created_at)
  end

  def show
    @meeting = Meeting.find(params[:id])
    @user = @meeting.user
  end

  private

  def check_current_user
    @meeting = Meeting.find(params[:id])
    @user = @meeting.user
    unless current_user == @user
      flash[:error] = 'Что-то пошло не так.'
      redirect_to root_path
    end
  end
end
