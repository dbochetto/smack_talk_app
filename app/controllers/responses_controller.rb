class ResponsesController < ApplicationController

  before_action :current_user_must_be_owner, :only => [:edit, :update, :destroy]

  def current_user_must_be_owner
    @response = Response.find(params[:id])
    if current_user != @response.user
      redirect_to "/smacks", :alert => "You can only edit your own response"
    end
  end

  def index
    @responses = Response.all
  end

  def show
    @response = Response.find(params[:id])
  end

  def new
    @response = Response.new
  end

  def create
    @response = Response.new
    @response.body = params[:body]
    @response.image = params[:image]
    @response.video = params[:video]
    @response.user_id = params[:user_id]
    @response.publication_id = params[:publication_id]
    @response.smack_id = params[:smack_id]

    if @response.save
      redirect_to :back, :notice => "Response created successfully."
    else
      render 'new'
    end
  end

  def edit
    @response = Response.find(params[:id])
  end

  def update
    @response = Response.find(params[:id])

    @response.body = params[:body]
    @response.image = params[:image]
    @response.video = params[:video]
    @response.user_id = params[:user_id]
    @response.publication_id = params[:publication_id]
    @response.smack_id = params[:smack_id]

    if @response.save
      redirect_to "/responses", :notice => "Response updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @response = Response.find(params[:id])

    @response.destroy

    redirect_to "/smacks", :notice => "Response deleted."
  end
end
