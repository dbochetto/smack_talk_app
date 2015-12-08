class PublicationsController < ApplicationController

  before_action :current_user_must_be_owner, :only => [:edit, :update, :destroy]

  def current_user_must_be_owner
    @publication = Publication.find(params[:id])
    if current_user != @publication.user
      redirect_to "/publications", :alert => "You can only edit your own publication"
    end
  end

  def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new
    @publication.title = params[:title]
    @publication.body = params[:body]
    @publication.league_id = params[:league_id]
    @publication.user_id = params[:user_id]

    if @publication.save
      redirect_to "/publications", :notice => "Publication created successfully."
    else
      render 'new'
    end
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])

    @publication.title = params[:title]
    @publication.body = params[:body]
    @publication.league_id = params[:league_id]
    @publication.user_id = params[:user_id]

    if @publication.save
      redirect_to "/publications", :notice => "Publication updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @publication = Publication.find(params[:id])

    @publication.destroy

    redirect_to "/publications", :notice => "Publication deleted."
  end
end
