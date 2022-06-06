class CommentsController < ApplicationController
  before_action :set_meeting, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def create
    # Создаём объект @new_comment из @meeting
    @new_comment = @meeting.comments.build(comment_params)
    # Проставляем пользователя, если он задан
    @new_comment.user = current_user
  
    if @new_comment.save
      # Если сохранился, редирект на страницу самого события
      notify_subscribers(@meeting, @new_comment)
      flash[:success] = I18n.t("my.controllers.comments.create")
      redirect_to @meeting
    else
      # Если ошибки — рендерим здесь же шаблон события (своих шаблонов у коммента нет)
      flash[:error] = I18n.t("my.controllers.all.error")
      render 'meetings/show'
    end
  end

  def destroy
    @user = @comment.meeting.user
    if current_user == @user
      @comment.destroy!
      flash[:success] = I18n.t("my.controllers.comments.destroy")
    else
      flash[:error] = I18n.t("my.controllers.all.error")
    end
  
    redirect_to @meeting
  end

  private
  
  def set_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def set_comment
    @comment = @meeting.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_name)
  end

  def notify_subscribers(event, comment)
    # Собираем всех подписчиков и автора события в массив мэйлов, исключаем повторяющиеся
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq
  
    # По адресам из этого массива делаем рассылку
    # Как и в подписках, берём EventMailer и его метод comment с параметрами
    # И отсылаем в том же потоке
    all_emails.each do |mail|
      MeetingMailer.comment(event, comment, mail).deliver_now
    end
  end
end
