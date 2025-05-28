Rails.application.routes.draw do
    #------------------------------
  # Devise Authentication
  devise_for :users
  # HOME PAGE
  get("/", { :controller => "home", :action => "index" })
  #------------------------------
  # Routes for the User resource:
  get("/users/:id", { :controller => "users", :action => "show" })
  post("/delete_user", { :controller => "users", :action => "destroy", :as => "delete_user" })

  # Nested route: user's playlists
  get("/users/:user_id/playlists", { :controller => "playlists", :action => "index" })
  get("/profile", { :controller => "users", :action => "show", :as => "profile" })

  get("/sign_up", to: redirect("/users/sign_up"))
  get("/log_in",  to: redirect("/users/sign_in"))
  get("/log_out", to: redirect("/users/sign_out"))

  #------------------------------
  # Routes for the Playlist resource:

  # Entry point to begin playlist creation
  get("/start", { :controller => "playlists", :action => "start" })

  # CREATE
  post("/insert_playlist", { :controller => "playlists", :action => "create" })

  # READ
  get("/playlists", { :controller => "playlists", :action => "index" })
  get("/playlists/:path_id", { :controller => "playlists", :action => "show" })

  # UPDATE
  post("/modify_playlist/:path_id", { :controller => "playlists", :action => "update" })

  # DELETE
  get("/delete_playlist/:path_id", { :controller => "playlists", :action => "destroy" })
  delete("/delete_playlist/:id", { :controller => "playlists", :action => "destroy" })


  # CUSTOM FLOW STEPS
  get("/playlists/:path_id/colors", { :controller => "playlists", :action => "colors" })
  post("/playlists/:path_id/colors", { :controller => "playlists", :action => "update_colors" })

  get("/playlists/:path_id/scents", { :controller => "playlists", :action => "scents", :as => "scents" })
  post("/playlists/:path_id/scents", { :controller => "playlists", :action => "update_scents", :as => "update_scents" })

  get("/playlists/:path_id/textures", { :controller => "playlists", :action => "textures" })
  post("/playlists/:path_id/textures", { :controller => "playlists", :action => "update_textures" })

  post("/playlists/:path_id/generate", { :controller => "playlists", :action => "generate", :as => :generate_playlist })

  #------------------------------
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

end
