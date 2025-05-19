Rails.application.routes.draw do
  # Routes for the Like resource:

  # CREATE
  post("/insert_like", { :controller => "likes", :action => "create" })
          
  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  
  get("/likes/:path_id", { :controller => "likes", :action => "show" })
  
  # UPDATE
  
  post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  
  # DELETE
  get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  # Routes for the Playlist resource:

  # CREATE
  post("/insert_playlist", { :controller => "playlists", :action => "create" })
          
  # READ
  get("/playlists", { :controller => "playlists", :action => "index" })
  
  get("/playlists/:path_id", { :controller => "playlists", :action => "show" })
  
  # UPDATE
  
  post("/modify_playlist/:path_id", { :controller => "playlists", :action => "update" })
  
  # DELETE
  get("/delete_playlist/:path_id", { :controller => "playlists", :action => "destroy" })

  #------------------------------

  devise_for :users

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
