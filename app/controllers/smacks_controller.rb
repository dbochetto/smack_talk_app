class SmacksController < ApplicationController

  before_action :current_user_must_be_owner, :only => [:edit, :update, :destroy]

  def current_user_must_be_owner
    @smack = Smack.find(params[:id])
    if current_user != @smack.user
      redirect_to "/smacks", :alert => "You can only edit your own trash talk"
    end
  end

  def index
    @smacks = Smack.all.reverse
  end

  def show
    @smack = Smack.find(params[:id])
  end

  def new
    @smack = Smack.new
  end

  def create
    @smack = Smack.new
    @smack.title = params[:title]
    @smack.body = params[:body]
    @smack.image = params[:image]
    @smack.video = params[:video]
    @smack.league_id = params[:league_id]
    @smack.user_id = params[:user_id]

    if @smack.save
      redirect_to "/smacks", :notice => "Smack created successfully."
    else
      render 'new'
    end
  end

  def edit
    @smack = Smack.find(params[:id])
  end

  def update
    @smack = Smack.find(params[:id])

    @smack.title = params[:title]
    @smack.body = params[:body]
    @smack.image = params[:image]
    @smack.video = params[:video]
    @smack.league_id = params[:league_id]
    @smack.user_id = params[:user_id]

    if @smack.save
      redirect_to "/smacks", :notice => "Smack updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @smack = Smack.find(params[:id])

    @smack.destroy

    redirect_to "/smacks", :notice => "Smack deleted."
  end
end
