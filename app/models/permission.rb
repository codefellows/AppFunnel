class Permission < Struct.new(:user)
  @@user_actions = %w(show new create edit update destroy)
  @@user_controls = %w(profiles apns)

  def allow?(controller, action, user_id)
    return true if user.admin? && action != "index"
    controller.in?(@@user_controls) &&
    action.in?(@@user_actions) &&
    user.id == user_id
  end
end
