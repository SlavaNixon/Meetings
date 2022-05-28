class MeetingsController < ApplicationController
  before_action :unavailable_request, only: %i[new edit destroy create update]
  before_action :check_current_user, only: %i[edit update destroy]

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    flash[:success] = I18n.t("my.controllers.meetings.destroy")
    redirect_to root_path
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update(meeting_content)
      redirect_to meeting_path(@meeting)
    else
      flash[:error] = I18n.t("my.controllers.all.error")
      render :edit
    end
  end

  def new
  end

  def create
    correct_params = meeting_content
    correct_params[:user] = current_user
    @meeting = Meeting.new(correct_params)
    if @meeting.save
      flash[:success] = I18n.t("my.controllers.meetings.create")
      redirect_to root_path
    else
      flash[:error] = I18n.t("my.controllers.all.error")
      render :new
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

  def meeting_content
    params.require(:meeting).permit(:name, :place, :date, :description)
  end

  def check_current_user
    @user = Meeting.find(params[:id]).user
    unless current_user == @user
      flash[:error] = I18n.t("my.controllers.all.error")
      redirect_to root_path
    end
  end
end
