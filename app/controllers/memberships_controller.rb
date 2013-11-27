class MembershipsController < ApplicationController

  before_filter :ensure_account 
  before_filter :ensure_group 
  
  def index
    @memberships = group.memberships
    respond_with @memberships
  end

  private
  
  def membership 
    @membership ||= Membership.find_by_id(params[:membership_id])
  end

  def group
    @group ||= Group.find_by_id(params[:group_id])
  end

  def account
    @account ||= Account.find_by_id(params[:account_id])
  end
  
  def ensure_group
    error :not_found unless group
  end

end
