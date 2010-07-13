class UserSessionsController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    # validate_users_without_authlogic_magic_states

    unless (is_valid_without_authlogic_magic_states?)
      render :action => :new
      return
    end

    if (!user_account_active?)
      redirect_to registration_review_path
      return
    end

    if @user_session.save
      redirect_back_or_default account_url
      #account = Account.find_by_login(@user_session.login)
      #redirect_to registration_review_path unless account.active?
      #return
    end
  end

  def destroy
    current_user_session.destroy
    redirect_back_or_default new_user_session_url
  end

private
  def is_valid_without_authlogic_magic_states?
    UserSession.disable_magic_states = true
    @user_session.validate
    result = @user_session.valid?
    UserSession.disable_magic_states = false
    result
  end

  def user_account_active?
    account = Account.find_by_login(@user_session.login)
    return account.active
  end

end

