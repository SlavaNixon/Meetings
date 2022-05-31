class SubscriptionsController < ApplicationController
  before_action :set_meeting, only: [:create, :destroy]
  before_action :set_subscription, only: [:destroy]

  def create
    # Болванка для новой подписки
    @new_subscription = @meeting.subscriptions.build(subscription_params)
    @new_subscription.user = current_user
  
    if @meeting.user != current_user && @new_subscription.save
      flash[:success] = I18n.t("my.controllers.subscriptions.create")
    else
      flash[:error] = I18n.t("my.controllers.all.error")
    end
    redirect_to @meeting
  end
  
  def destroy
    if @meeting.user == current_user
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
  end

  def set_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def subscription_params
    # .fetch разрешает в params отсутствие ключа :subscription
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end
end
