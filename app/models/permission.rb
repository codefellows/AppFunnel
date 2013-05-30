class Permission < Struct.new(:user)
  @@user_actions = %w(show new create edit update destroy)
  @@user_controls = %w(profiles apns)

  def allow?(controller, action)
    controller.in?(@@user_controls) &&
    action.in?(@@user_actions) &&
    if @profile
      user.id == @profile.user_id
    else
      true
    end
  end
end
