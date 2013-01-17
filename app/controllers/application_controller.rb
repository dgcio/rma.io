class ApplicationController < ActionController::Base
  protect_from_forgery

  def update_timer
    @expire = User.session_expired(session[:expire])
    if @expire
      render :nothing => true
    else
      render :text => "Session: #{(session[:expire] - Time.now).round}ms", :cache => true
    end
  end
end