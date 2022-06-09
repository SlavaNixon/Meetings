class SubscriptionsController < ApplicationController
  before_action :set_meeting, only: [:create, :destroy]
  before_action :set_subscription, only: [:destroy]

  def create
    # Болванка для новой подписки
    @new_subscription = @meeting.subscriptions.build(subscription_params)
    @new_subscription.user = current_user
    if @new_subscription.save
      MeetingMailer.subscription(@new_subscription).deliver_now
      flash[:success] = I18n.t("my.controllers.subscriptions.create")
    else
      flash[:error] = I18n.t("my.controllers.all.error")
    end
    redirect_to @meeting
  end
  
  def destroy
    if user_can_delete?(@meeting.user)
      @subscription.destroy
      flash[:success] = I18n.t("my.controllers.subscriptions.destroy")
    else
      flash[:error] = I18n.t("my.controllers.all.error")
    end
  
    redirect_to @meeting
  end

  private

  def set_subscription
    @subscription = @meeting.subscriptions.find(params[:id])
    @user = @subscription.user
  end

  def set_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def subscription_params
    # .fetch разрешает в params отсутствие ключа :subscription
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end
end
