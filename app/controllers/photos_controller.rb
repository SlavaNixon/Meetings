class PhotosController < ApplicationController
  before_action :set_meeting, only: [:create, :destroy]
  before_action :set_photo, only: [:destroy]

  def create
    # Создаем новую фотографию у нужного события @event
    @new_photo = @meeting.photos.build(photo_params)
    # Проставляем у фотографии пользователя
    @new_photo.user = current_user

    if @new_photo.save
      notify_subscribers(@meeting, @new_photo)
      # Если фотка сохранилась, редиректим на событие с сообщением
      flash[:success] = I18n.t("my.controllers.photos.create")
    else
      # Если нет — рендерим событие с ошибкой
      flash[:error] = I18n.t("my.controllers.all.error")
    end
    redirect_to @meeting
  end

  def destroy
    if user_can_delete?(@meeting.user)
      @photo.destroy
      flash[:success] = I18n.t("my.controllers.photos.destroy")
    else
      flash[:error] = I18n.t("my.controllers.all.error")
    end

    redirect_to @meeting
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def set_photo
    @photo = @meeting.photos.find(params[:id])
    @user = @photo.user
  end

  def photo_params
    params.fetch(:photo, {}).permit(:photo)
  end

  def notify_subscribers(event, photo)
    all_emails = event.subscriptions.map(&:user_email) + [event.user.email]
  
    all_emails.excluding(photo.user.email).each do |mail|
      MeetingMailer.photo(event, photo, mail).deliver_now
    end
  end
end
