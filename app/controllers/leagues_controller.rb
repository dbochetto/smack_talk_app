class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new
    @league.name = params[:name]
    @league.user_id = params[:user_id]

    if @league.save
      redirect_to "/leagues", :notice => "League created successfully."
    else
      render 'new'
    end
  end

  def edit
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])

    @league.name = params[:name]
    @league.user_id = params[:user_id]

    if @league.save
      redirect_to "/leagues", :notice => "League updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @league = League.find(params[:id])

    @league.destroy

    redirect_to "/leagues", :notice => "League deleted."
  end

  def smacks
    cookies[:current_league_id] = params[:id]

    @smacks = Smack.where(:league_id => params[:id]).reverse
  end

  def publications
    @publications = Publication.where(:league_id => params[:id]).reverse
  end

  def show_smacks
    @smack = Smack.find(params[:id])
  end

  def show_publications
    @publication = Publication.find(params[:id])
  end

end
