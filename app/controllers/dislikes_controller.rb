class DislikesController < ApplicationController
  def index
    @dislikes = Dislike.all
  end

  def show
    @dislike = Dislike.find(params[:id])
  end

  def new
    @dislike = Dislike.new
  end

  def create
    @dislike = Dislike.new
    @dislike.smack_id = params[:smack_id]
    @dislike.user_id = params[:user_id]
    @dislike.response_id = params[:response_id]

    if @dislike.save
      redirect_to "/smacks", :notice => "Dislike created successfully."
    else
      render 'new'
    end
  end

  def edit
    @dislike = Dislike.find(params[:id])
  end

  def update
    @dislike = Dislike.find(params[:id])

    @dislike.smack_id = params[:smack_id]
    @dislike.user_id = params[:user_id]
    @dislike.response_id = params[:response_id]

    if @dislike.save
      redirect_to "/dislikes", :notice => "Dislike updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @dislike = Dislike.find(params[:id])

    @dislike.destroy

    redirect_to "/smacks", :notice => "Dislike deleted."
  end
end
