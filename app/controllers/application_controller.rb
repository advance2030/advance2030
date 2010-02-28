require 'authlogic'

class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  helper_method :current_user_session, :current_user
  filter_parameter_logging :password, :password_confirmation

  def redirect_permanent(url)
    head :moved_permanently, :location => url
    return
  end

  def render_404
    render :file => File.join(Rails.root, 'public', '404.html')
  end

  def render_edit
    render :action => :edit
  end

  def render_new
    render :action => :new
  end

  def flash_and_redirect(location, msg)
    flash[:notice] = if msg then msg else '' end
    redirect_to(location)
    return
  end

  def flash_and_redirect_back_or_default(location, msg)
    flash[:notice] = if msg then msg else '' end
    redirect_back_or_default(location)
    return
  end

private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      redirect_to account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
