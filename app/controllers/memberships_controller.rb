class MembershipsController < ApplicationController
  def index
    @memberships = Membership.all
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
