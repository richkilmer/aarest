class AccountsController < ApplicationController

  def index
    @accounts = Account.all
    respond_with @accounts
  end

  def show
    respond_with account
  end

  def create
    @account = Account.create(resource_params)
    respond_with account
  end

  def update
    account.update_attributes(resource_params)
    respond_with account
  end

  def destroy
    account.destroy
    respond_with account
  end

  private
  
  def account
    @account ||= Account.find(params[:id])
  end
  
  def resource_params
    params.require(:account).permit(:name)
  end

end
