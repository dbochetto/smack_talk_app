class LeaguesController < ApplicationController

  before_action :current_user_must_be_owner_of_smack, :only => [:edit_smack, :update_smack, :destroy_smack]

  before_action :current_user_must_be_owner_of_publication, :only => [:edit_publication, :update_publication, :destroy_publication]

  before_action :must_be_member_of_league_for_index, :only => [:smacks, :publications, :new_smack, :new_publication]

  before_action :must_be_member_of_league_for_smack, :only => [:show_smacks, :edit_smack]

  before_action :must_be_member_of_league_for_publication, :only => [:show_publications, :edit_publication]

  #Authentications for editing / deleting smacks and publications:

  def current_user_must_be_owner_of_smack
    @smack = Smack.find(params[:id])
    if current_user != @smack.user
      redirect_to :back, :alert => "You can only edit your own trash talk"
    end
  end

  def current_user_must_be_owner_of_publication
    @publication = Publication.find(params[:id])
    if current_user != @publication.user
      redirect_to :back, :alert => "You can only edit your own trash talk"
    end
  end

  #End Authentications for editing / deleting smacks and publications:

  #Authentications for League Members:

  def must_be_member_of_league_for_index
    @league = League.find(params[:id])

    if current_user.memberships.find_by({:league_id => @league.id}) == nil
      redirect_to "/memberships", :alert => "You are not a member of this league. Choose one of your leagues to visit"
    end
  end

  def must_be_member_of_league_for_smack
    @league = Smack.find(params[:id]).league

    if current_user.memberships.find_by({:league_id => @league.id}) == nil
      redirect_to "/memberships", :alert => "You are not a member of this league. Choose one of your leagues to visit"
    end
  end


  def must_be_member_of_league_for_publication
    @league = Publication.find(params[:id]).league

    if current_user.memberships.find_by({:league_id => @league.id}) == nil
      redirect_to "/memberships", :alert => "You are not a member of this league. Choose one of your leagues to visit"
    end
  end

  #End Authentications for League Members:

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
      first_member = Membership.new
      first_member.user_id = current_user.id
      first_member.league_id = @league.id
      first_member.save

      redirect_to "/memberships", :notice => "League created successfully."
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

  #******WITHIN LEAGUE RCAV******
  #SMACKS
  def smacks
    cookies[:current_league_id] = params[:id]

    @smacks = Smack.where(:league_id => params[:id]).reverse
  end

  def new_smack
    @smack = Smack.new
  end

  def create_smack
    @smack = Smack.new
    @smack.title = params[:title]
    @smack.body = params[:body]
    @smack.image = params[:image]
    @smack.video = params[:video]
    @smack.league_id = params[:league_id]
    @smack.user_id = params[:user_id]

    if @smack.save
      redirect_to "/leagues/#{@smack.league_id}/smacks", :notice => "Smack created successfully."
    else
      render 'new'
    end
  end

  def show_smacks
    @smack = Smack.find(params[:id])
  end

  def edit_smack
    @smack = Smack.find(params[:id])
  end

  def update_smack
    @smack = Smack.find(params[:id])

    @smack.title = params[:title]
    @smack.body = params[:body]
    @smack.image = params[:image]
    @smack.video = params[:video]
    @smack.league_id = params[:league_id]
    @smack.user_id = params[:user_id]

    if @smack.save
      redirect_to "/leagues/#{@smack.league_id}/smacks", :notice => "Trash talk updated successfully."
    else
      render 'edit'
    end
  end

  def destroy_smack
    @smack = Smack.find(params[:id])

    @smack.destroy

    redirect_to "/leagues/#{@smack.league_id}/smacks", :notice => "Trash talk deleted."
  end

  #PUBLICATIONS
  def publications
    cookies[:current_league_id] = params[:id]

    @publications = Publication.where(:league_id => params[:id]).reverse
  end

  def new_publication
    @publication = Publication.new
  end

  def create_publication
    @publication = Publication.new
    @publication.title = params[:title]
    @publication.body = params[:body]
    @publication.league_id = params[:league_id]
    @publication.user_id = params[:user_id]

    if @publication.save
      redirect_to "/leagues/#{@publication.league_id}/publications", :notice => "Publication created successfully."
    else
      render 'new'
    end
  end

  def show_publications
    @publication = Publication.find(params[:id])
  end

  def edit_publication
    @publication = Publication.find(params[:id])
  end

  def update_publication
    @publication = Publication.find(params[:id])

    @publication.title = params[:title]
    @publication.body = params[:body]
    @publication.league_id = params[:league_id]
    @publication.user_id = params[:user_id]

    if @publication.save
      redirect_to "/leagues/#{@publication.league_id}/publications", :notice => "Publication updated successfully."
    else
      render 'edit'
    end
  end

  def destroy_publication
    @publication = Publication.find(params[:id])

    @publication.destroy

    redirect_to "/leagues/#{@publication.league_id}/publications", :notice => "Publication deleted."
  end

  #USERS
  def users
    cookies[:current_league_id] = params[:id]

    league = League.find(params[:id])
    @users = league.users
  end

  def show_users
    cookies[:current_league_id] = params[:id]

    @user = User.find(params[:id])
  end

end
