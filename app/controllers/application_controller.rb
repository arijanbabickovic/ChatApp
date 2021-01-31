class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    # allows the use of these methods in my views
    
    before_action :update_last_seen_at, if: -> { logged_in? && (current_user.last_seen_at.nil? || current_user.last_seen_at < 1.minutes.ago) }
    # before every load, we only want to update the last seen column if the user is logged in and if the current user is logging in the first time or the value of last seen is more than 2 minutes old
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
        !!current_user
        # turns current_user to a boolean
    end
    
    def require_user
        if !logged_in?
           flash[:error] = "You must be logged in to perform that action."
           redirect_to login_path
        end
    end
    
    def update_last_seen_at
      current_user.update_attribute(:last_seen_at, Time.current)
    end
end