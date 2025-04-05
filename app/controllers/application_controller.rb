class ApplicationController < ActionController::Base
  include Authentication

  before_action :set_user

  helper_method :current_user
  helper_method :current_agent

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def current_user
    @current_user ||= Current.session&.user
  end

  def current_agent
    @current_agent ||= Agent.find(Current.session&.user.active_agent)
  end

  def set_user
    @user = current_user
  end
end
