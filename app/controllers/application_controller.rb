class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user_the_host?, :current_user_a_venue?

  def current_user_the_host?(event)
  	defined?(current_user) ? current_user == event.venue.user : false
  end

  def current_user_a_venue?
    defined?(current_user) && ! Venue.find_by(user_id: current_user.id).nil?
  end

end
