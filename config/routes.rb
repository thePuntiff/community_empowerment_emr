Rails.application.routes.draw do
  # Routes for the Patient resource:

  # CREATE
  get("/patients/new", { :controller => "patients", :action => "new_form" })
  post("/create_patient", { :controller => "patients", :action => "create_row" })

  # READ
  get("/patients", { :controller => "patients", :action => "index" })
  get("/patients/:id_to_display", { :controller => "patients", :action => "show" })

  # UPDATE
  get("/patients/:prefill_with_id/edit", { :controller => "patients", :action => "edit_form" })
  post("/update_patient/:id_to_modify", { :controller => "patients", :action => "update_row" })

  # DELETE
  get("/delete_patient/:id_to_remove", { :controller => "patients", :action => "destroy_row" })

  #------------------------------

  devise_for :providers
  # Routes for the Provider resource:

  # READ
  get("/providers", { :controller => "providers", :action => "index" })
  get("/providers/:id_to_display", { :controller => "providers", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
