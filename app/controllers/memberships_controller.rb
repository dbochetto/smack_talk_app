class MembershipsController < ApplicationController
  def index
    if current_user.memberships.count > 0
      cookies[:current_league_id] = current_user.memberships.first.league_id
    else
      redirect_to "/memberships/new"
    end

    @memberships = current_user.memberships
  end

  def show
    @membership = Membership.find(params[:id])
  end

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new
    @membership.league_id = params[:league_id]
    @membership.user_id = params[:user_id]

    if @membership.save
      redirect_to "/memberships", :notice => "Membership created successfully."
    else
      render 'new'
    end
  end

  def edit
    @membership = Membership.find(params[:id])
  end

  def update
    @membership = Membership.find(params[:id])

    @membership.league_id = params[:league_id]
    @membership.user_id = params[:user_id]

    if @membership.save
      redirect_to "/memberships", :notice => "Membership updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @membership = Membership.find(params[:id])

    @membership.destroy

    redirect_to "/memberships", :notice => "Membership deleted."
  end
end
