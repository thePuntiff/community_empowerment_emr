Rails.application.routes.draw do
  devise_for :providers
  # Routes for the Provider resource:

  # READ
  get("/providers", { :controller => "providers", :action => "index" })
  get("/providers/:id_to_display", { :controller => "providers", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
