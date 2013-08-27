class AdminApnsController < ApplicationController
  before_filter :authorize_admin

  def index
    @apns = Apn.submitted.not_reviewed.order("created_at")
  end

private
  def authorize_admin
    unless current_user.admin
      redirect_to root_path
    end
  end

end
