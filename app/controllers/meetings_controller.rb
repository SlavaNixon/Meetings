class MeetingsController < ApplicationController
  def new
    unavailable_request
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
end

def unavailable_request
  unless user_signed_in?
    flash[:error] = 'Вам это недоступно.'
    redirect_to root_path
  end
end
