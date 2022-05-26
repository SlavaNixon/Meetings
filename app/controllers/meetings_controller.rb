class MeetingsController < ApplicationController
  def new
    unavailable_request
  end
end

def unavailable_request
  unless user_signed_in?
    flash[:error] = 'Вам это недоступно.'
    redirect_to root_path
  end
end
