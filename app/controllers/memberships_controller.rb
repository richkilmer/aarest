class MembershipsController < ApplicationController

  before_filter :ensure_group 
  
  def index
    @memberships = group.memberships
    respond_with @memberships
  end
  
  def create
    if membership_user
      @membership = group.memberships.create(user:membership_user)
      respond_with membership
    else
      head :bad_request
    end
  end
  
  def destroy
    membership.destroy
    respond_with membership
  end

  private
  
  def membership_user
    @user ||= account.users.find_by_id(params[:membership][:user_id])
  end
  
  def membership 
    @membership ||= group.memberships.find(params[:membership_id])
  end

  def group
    @group ||= account.groups.find(params[:group_id])
  end

  def account
    @account ||= Account.find(params[:account_id])
  end
  
  def ensure_group
    error :not_found unless group
  end

end
