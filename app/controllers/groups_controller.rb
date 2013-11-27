class GroupsController < ApplicationController

  before_filter :require_operations
  before_filter :ensure_account
  before_filter :ensure_group, :only => [:show, :update, :destroy, :reactivate]

  def index
    @groups = user ? user.groups : account.groups
    respond_with @users
  end

  def show
    respond_with group
  end

  def create
    @group = account.groups.create(resource_params)
    respond_with group
  end

  def update
    group.update_attributes(resource_params)
    respond_with group
  end

  def destroy
    group.deactivate!
    respond_with group
  end

  def reactivate
    group.activate! unless group.active?
    respond_with group
  end

  private

  def group
    @group ||= Group.find_by_id(params[:id])
  end

  def account
    @account ||= Account.find_by_id(params[:account_id])
  end
  
  def user
    @user ||= User.find_by_id(params[:user_id])
  end
  
  def ensure_group
    error :not_found unless group && account.groups.find_by_id(params[:id])
  end

  def resource_params
    params.require(:group).permit(:name)
  end

end
