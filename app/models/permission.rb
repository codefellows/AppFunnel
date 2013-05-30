class Permission < Struct.new(:user)
  @@user_actions = %w(show new create edit update destroy)
  @@user_controls = %w(profiles apns)

  def allow?(controller, action)
    # return true if user.admin?
    controller.in?(@@user_controls) &&
    action.in?(@@user_actions) &&
    if @apn
      @profile.id == @apn.profile_id
    elsif @profile
      user.id == @profile.user_id
    else
      true
    end
  end
end
