class AccountsController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(params[:user])
    if @account.save
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
    @account = @current_user
  end
 
  def edit
    @account = @current_user
  end
  
  def update
    @account = @current_user # makes our views "cleaner" and more consistent
    if @account.update_attributes(params[:user])
      redirect_to account_url
    else
      render :action => :edit
    end
  end  
  
end
