Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "encounters#index"
  
  # Routes for the admin
  get("/adminpanel", {:controller => "admin_panel", :action => "index"})
  
  # Routes for the summary views
  get("/summary", {:controller => "summary", :action => "show"})
  
  # Routes for the Sex resource:

  # CREATE
  get("/sexes/new", { :controller => "sexes", :action => "new_form" })
  post("/create_sex", { :controller => "sexes", :action => "create_row" })

  # READ
  get("/sexes", { :controller => "sexes", :action => "index" })
  get("/sexes/:id_to_display", { :controller => "sexes", :action => "show" })

  # UPDATE
  get("/sexes/:prefill_with_id/edit", { :controller => "sexes", :action => "edit_form" })
  post("/update_sex/:id_to_modify", { :controller => "sexes", :action => "update_row" })

  # DELETE
  get("/delete_sex/:id_to_remove", { :controller => "sexes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Prescription resource:

  # CREATE
  get("/prescriptions/new", { :controller => "prescriptions", :action => "new_form" })
  post("/create_prescription", { :controller => "prescriptions", :action => "create_row" })
  post("/create_prescription_from_medication", { :controller => "prescriptions", :action => "create_row_from_medication" })
  post("/create_prescription_from_encounter", { :controller => "prescriptions", :action => "create_row_from_encounter" })
  post("/create_prescription_from_patient", { :controller => "prescriptions", :action => "create_row_from_patient" })
  post("/create_prescription_from_prescription", { :controller => "prescriptions", :action => "create_row_from_prescription" })

  # READ
  get("/prescriptions", { :controller => "prescriptions", :action => "index" })
  get("/prescriptions/:id_to_display", { :controller => "prescriptions", :action => "show" })

  # UPDATE
  get("/prescriptions/:prefill_with_id/edit", { :controller => "prescriptions", :action => "edit_form" })
  post("/update_prescription/:id_to_modify", { :controller => "prescriptions", :action => "update_row" })

  # DELETE
  get("/delete_prescription/:id_to_remove", { :controller => "prescriptions", :action => "destroy_row" })
  get("/delete_prescription_from_medication/:id_to_remove", { :controller => "prescriptions", :action => "destroy_row_from_medication" })
  get("/delete_prescription_from_encounter/:id_to_remove", { :controller => "prescriptions", :action => "destroy_row_from_encounter" })
  get("/delete_prescription_from_patient/:id_to_remove", { :controller => "prescriptions", :action => "destroy_row_from_patient" })
  get("/delete_prescription_from_provider/:id_to_remove", { :controller => "prescriptions", :action => "destroy_row_from_provider" })

  #------------------------------

  # Routes for the Med type resource:

  # CREATE
  get("/med_types/new", { :controller => "med_types", :action => "new_form" })
  post("/create_med_type", { :controller => "med_types", :action => "create_row" })

  # READ
  get("/med_types", { :controller => "med_types", :action => "index" })
  get("/med_types/:id_to_display", { :controller => "med_types", :action => "show" })

  # UPDATE
  get("/med_types/:prefill_with_id/edit", { :controller => "med_types", :action => "edit_form" })
  post("/update_med_type/:id_to_modify", { :controller => "med_types", :action => "update_row" })

  # DELETE
  get("/delete_med_type/:id_to_remove", { :controller => "med_types", :action => "destroy_row" })

  #------------------------------

  # Routes for the Medication resource:

  # CREATE
  get("/medications/new", { :controller => "medications", :action => "new_form" })
  post("/create_medication", { :controller => "medications", :action => "create_row" })
  post("/create_medication_from_med_type", { :controller => "medications", :action => "create_row_from_med_type" })

  # READ
  get("/medications", { :controller => "medications", :action => "index" })
  get("/medications/:id_to_display", { :controller => "medications", :action => "show" })

  # UPDATE
  get("/medications/:prefill_with_id/edit", { :controller => "medications", :action => "edit_form" })
  post("/update_medication/:id_to_modify", { :controller => "medications", :action => "update_row" })

  # DELETE
  get("/delete_medication/:id_to_remove", { :controller => "medications", :action => "destroy_row" })
  get("/delete_medication_from_med_type/:id_to_remove", { :controller => "medications", :action => "destroy_row_from_med_type" })

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
  post("/create_encounter_from_location", { :controller => "encounters", :action => "create_row_from_location" })
  post("/create_encounter_from_patient", { :controller => "encounters", :action => "create_row_from_patient" })

  # READ
  get("/encounters", { :controller => "encounters", :action => "index" })
  get("/encounters/:id_to_display", { :controller => "encounters", :action => "show" })

  # UPDATE
  get("/encounters/:prefill_with_id/edit", { :controller => "encounters", :action => "edit_form" })
  post("/update_encounter/:id_to_modify", { :controller => "encounters", :action => "update_row" })

  # DELETE
  get("/delete_encounter/:id_to_remove", { :controller => "encounters", :action => "destroy_row" })
  get("/delete_encounter_from_location/:id_to_remove", { :controller => "encounters", :action => "destroy_row_from_location" })
  get("/delete_encounter_from_patient/:id_to_remove", { :controller => "encounters", :action => "destroy_row_from_patient" })
  get("/delete_encounter_from_approving_provider/:id_to_remove", { :controller => "encounters", :action => "destroy_row_from_approving_provider" })
  get("/delete_encounter_from_provider/:id_to_remove", { :controller => "encounters", :action => "destroy_row_from_provider" })

  #------------------------------

  # Routes for the Provider credential resource:

  # CREATE
  get("/provider_credentials/new", { :controller => "provider_credentials", :action => "new_form" })
  post("/create_provider_credential", { :controller => "provider_credentials", :action => "create_row" })
  post("/create_provider_credential_from_credential", { :controller => "provider_credentials", :action => "create_row_from_credential" })

  # READ
  get("/provider_credentials", { :controller => "provider_credentials", :action => "index" })
  get("/provider_credentials/:id_to_display", { :controller => "provider_credentials", :action => "show" })

  # UPDATE
  get("/provider_credentials/:prefill_with_id/edit", { :controller => "provider_credentials", :action => "edit_form" })
  post("/update_provider_credential/:id_to_modify", { :controller => "provider_credentials", :action => "update_row" })

  # DELETE
  get("/delete_provider_credential/:id_to_remove", { :controller => "provider_credentials", :action => "destroy_row" })
  get("/delete_provider_credential_from_credential/:id_to_remove", { :controller => "provider_credentials", :action => "destroy_row_from_credential" })
  get("/delete_provider_credential_from_provider/:id_to_remove", { :controller => "provider_credentials", :action => "destroy_row_from_provider" })

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
  post("/create_patient_from_sex", { :controller => "patients", :action => "create_row_from_sex" })

  # READ
  get("/patients", { :controller => "patients", :action => "index" })
  get("/patients/:id_to_display", { :controller => "patients", :action => "show" })

  # UPDATE
  get("/patients/:prefill_with_id/edit", { :controller => "patients", :action => "edit_form" })
  post("/update_patient/:id_to_modify", { :controller => "patients", :action => "update_row" })

  # DELETE
  get("/delete_patient/:id_to_remove", { :controller => "patients", :action => "destroy_row" })
  get("/delete_patient_from_sex/:id_to_remove", { :controller => "patients", :action => "destroy_row_from_sex" })

  #------------------------------

  devise_for :providers
  # Routes for the Provider resource:

  # READ
  get("/providers", { :controller => "providers", :action => "index" })
  get("/providers/:id_to_display", { :controller => "providers", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
