Rails.application.routes.draw do
  # Routes for the Medication resource:

  # CREATE
  get("/medications/new", { :controller => "medications", :action => "new_form" })
  post("/create_medication", { :controller => "medications", :action => "create_row" })

  # READ
  get("/medications", { :controller => "medications", :action => "index" })
  get("/medications/:id_to_display", { :controller => "medications", :action => "show" })

  # UPDATE
  get("/medications/:prefill_with_id/edit", { :controller => "medications", :action => "edit_form" })
  post("/update_medication/:id_to_modify", { :controller => "medications", :action => "update_row" })

  # DELETE
  get("/delete_medication/:id_to_remove", { :controller => "medications", :action => "destroy_row" })

  #------------------------------

  # Routes for the Location resource:

  # CREATE
  get("/locations/new", { :controller => "locations", :action => "new_form" })
  post("/create_location", { :controller => "locations", :action => "create_row" })

  # READ
  get("/locations", { :controller => "locations", :action => "index" })
  get("/locations/:id_to_display", { :controller => "locations", :action => "show" })

  # UPDATE
  get("/locations/:prefill_with_id/edit", { :controller => "locations", :action => "edit_form" })
  post("/update_location/:id_to_modify", { :controller => "locations", :action => "update_row" })

  # DELETE
  get("/delete_location/:id_to_remove", { :controller => "locations", :action => "destroy_row" })

  #------------------------------

  # Routes for the Encounter resource:

  # CREATE
  get("/encounters/new", { :controller => "encounters", :action => "new_form" })
  post("/create_encounter", { :controller => "encounters", :action => "create_row" })

  # READ
  get("/encounters", { :controller => "encounters", :action => "index" })
  get("/encounters/:id_to_display", { :controller => "encounters", :action => "show" })

  # UPDATE
  get("/encounters/:prefill_with_id/edit", { :controller => "encounters", :action => "edit_form" })
  post("/update_encounter/:id_to_modify", { :controller => "encounters", :action => "update_row" })

  # DELETE
  get("/delete_encounter/:id_to_remove", { :controller => "encounters", :action => "destroy_row" })

  #------------------------------

  # Routes for the Provider credential resource:

  # CREATE
  get("/provider_credentials/new", { :controller => "provider_credentials", :action => "new_form" })
  post("/create_provider_credential", { :controller => "provider_credentials", :action => "create_row" })

  # READ
  get("/provider_credentials", { :controller => "provider_credentials", :action => "index" })
  get("/provider_credentials/:id_to_display", { :controller => "provider_credentials", :action => "show" })

  # UPDATE
  get("/provider_credentials/:prefill_with_id/edit", { :controller => "provider_credentials", :action => "edit_form" })
  post("/update_provider_credential/:id_to_modify", { :controller => "provider_credentials", :action => "update_row" })

  # DELETE
  get("/delete_provider_credential/:id_to_remove", { :controller => "provider_credentials", :action => "destroy_row" })

  #------------------------------

  # Routes for the Credential resource:

  # CREATE
  get("/credentials/new", { :controller => "credentials", :action => "new_form" })
  post("/create_credential", { :controller => "credentials", :action => "create_row" })

  # READ
  get("/credentials", { :controller => "credentials", :action => "index" })
  get("/credentials/:id_to_display", { :controller => "credentials", :action => "show" })

  # UPDATE
  get("/credentials/:prefill_with_id/edit", { :controller => "credentials", :action => "edit_form" })
  post("/update_credential/:id_to_modify", { :controller => "credentials", :action => "update_row" })

  # DELETE
  get("/delete_credential/:id_to_remove", { :controller => "credentials", :action => "destroy_row" })

  #------------------------------

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
