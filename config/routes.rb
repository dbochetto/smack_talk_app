Rails.application.routes.draw do

  root "smacks#index"

  # Routes for the Dislike resource:
  # CREATE
  get "/dislikes/new", :controller => "dislikes", :action => "new"
  post "/create_dislike", :controller => "dislikes", :action => "create"

  # READ
  get "/dislikes", :controller => "dislikes", :action => "index"
  get "/dislikes/:id", :controller => "dislikes", :action => "show"

  # UPDATE
  get "/dislikes/:id/edit", :controller => "dislikes", :action => "edit"
  post "/update_dislike/:id", :controller => "dislikes", :action => "update"

  # DELETE
  get "/delete_dislike/:id", :controller => "dislikes", :action => "destroy"
  #------------------------------

  # Routes for the Like resource:
  # CREATE
  get "/likes/new", :controller => "likes", :action => "new"
  post "/create_like", :controller => "likes", :action => "create"

  # READ
  get "/likes", :controller => "likes", :action => "index"
  get "/likes/:id", :controller => "likes", :action => "show"

  # UPDATE
  get "/likes/:id/edit", :controller => "likes", :action => "edit"
  post "/update_like/:id", :controller => "likes", :action => "update"

  # DELETE
  get "/delete_like/:id", :controller => "likes", :action => "destroy"
  #------------------------------

  # Routes for the Response resource:
  # CREATE
  get "/responses/new", :controller => "responses", :action => "new"
  post "/create_response", :controller => "responses", :action => "create"

  # READ
  get "/responses", :controller => "responses", :action => "index"
  get "/responses/:id", :controller => "responses", :action => "show"

  # UPDATE
  get "/responses/:id/edit", :controller => "responses", :action => "edit"
  post "/update_response/:id", :controller => "responses", :action => "update"

  # DELETE
  get "/delete_response/:id", :controller => "responses", :action => "destroy"
  #------------------------------

  # Routes for the Smack resource:
  # CREATE
  get "/smacks/new", :controller => "smacks", :action => "new"
  post "/create_smack", :controller => "smacks", :action => "create"

  # READ
  get "/smacks", :controller => "smacks", :action => "index"
  get "/smacks/:id", :controller => "smacks", :action => "show"

  # UPDATE
  get "/smacks/:id/edit", :controller => "smacks", :action => "edit"
  post "/update_smack/:id", :controller => "smacks", :action => "update"

  # DELETE
  get "/delete_smack/:id", :controller => "smacks", :action => "destroy"
  #------------------------------

  # Routes for the Publication resource:
  # CREATE
  get "/publications/new", :controller => "publications", :action => "new"
  post "/create_publication", :controller => "publications", :action => "create"

  # READ
  get "/publications", :controller => "publications", :action => "index"
  get "/publications/:id", :controller => "publications", :action => "show"

  # UPDATE
  get "/publications/:id/edit", :controller => "publications", :action => "edit"
  post "/update_publication/:id", :controller => "publications", :action => "update"

  # DELETE
  get "/delete_publication/:id", :controller => "publications", :action => "destroy"
  #------------------------------

  # Routes for the Membership resource:
  # CREATE
  get "/memberships/new", :controller => "memberships", :action => "new"
  post "/create_membership", :controller => "memberships", :action => "create"

  # READ
  get "/memberships", :controller => "memberships", :action => "index"
  get "/memberships/:id", :controller => "memberships", :action => "show"

  # UPDATE
  get "/memberships/:id/edit", :controller => "memberships", :action => "edit"
  post "/update_membership/:id", :controller => "memberships", :action => "update"

  # DELETE
  get "/delete_membership/:id", :controller => "memberships", :action => "destroy"
  #------------------------------

  # Routes for the League resource:
  # CREATE
  get "/leagues/new", :controller => "leagues", :action => "new"
  post "/create_league", :controller => "leagues", :action => "create"

  # READ
  get "/leagues", :controller => "leagues", :action => "index"
  get "/leagues/:id", :controller => "leagues", :action => "show"

  # UPDATE
  get "/leagues/:id/edit", :controller => "leagues", :action => "edit"
  post "/update_league/:id", :controller => "leagues", :action => "update"

  # DELETE
  get "/delete_league/:id", :controller => "leagues", :action => "destroy"
  #------------------------------

  devise_for :users

  # Routes for the USER resource:
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

end
