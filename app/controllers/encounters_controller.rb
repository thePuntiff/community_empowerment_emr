class EncountersController < ApplicationController
  def index
    @encounters = Encounter.all

    render("encounter_templates/index.html.erb")
  end

  def show
    @prescription = Prescription.new
    @encounter = Encounter.find(params.fetch("id_to_display"))

    render("encounter_templates/show.html.erb")
  end

  def new_form
    @encounter = Encounter.new

    render("encounter_templates/new_form.html.erb")
  end

  def create_row
    @encounter = Encounter.new

    @encounter.provider_id = params.fetch("provider_id")
    @encounter.patient_id = params.fetch("patient_id")
    @encounter.chief_complaint = params.fetch("chief_complaint")
    @encounter.notes = params.fetch("notes")
    @encounter.location_id = params.fetch("location_id")
    @encounter.approving_provider_id = params.fetch("approving_provider_id")

    if @encounter.valid?
      @encounter.save

      redirect_back(:fallback_location => "/encounters", :notice => "Encounter created successfully.")
    else
      render("encounter_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_patient
    @encounter = Encounter.new

    @encounter.provider_id = params.fetch("provider_id")
    @encounter.patient_id = params.fetch("patient_id")
    @encounter.chief_complaint = params.fetch("chief_complaint")
    @encounter.notes = params.fetch("notes")
    @encounter.location_id = params.fetch("location_id")
    @encounter.approving_provider_id = params.fetch("approving_provider_id")

    if @encounter.valid?
      @encounter.save

      redirect_to("/patients/#{@encounter.patient_id}", notice: "Encounter created successfully.")
    else
      render("encounter_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_location
    @encounter = Encounter.new

    @encounter.provider_id = params.fetch("provider_id")
    @encounter.patient_id = params.fetch("patient_id")
    @encounter.chief_complaint = params.fetch("chief_complaint")
    @encounter.notes = params.fetch("notes")
    @encounter.location_id = params.fetch("location_id")
    @encounter.approving_provider_id = params.fetch("approving_provider_id")

    if @encounter.valid?
      @encounter.save

      redirect_to("/locations/#{@encounter.location_id}", notice: "Encounter created successfully.")
    else
      render("encounter_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @encounter = Encounter.find(params.fetch("prefill_with_id"))

    render("encounter_templates/edit_form.html.erb")
  end

  def update_row
    @encounter = Encounter.find(params.fetch("id_to_modify"))

    @encounter.provider_id = params.fetch("provider_id")
    @encounter.patient_id = params.fetch("patient_id")
    @encounter.chief_complaint = params.fetch("chief_complaint")
    @encounter.notes = params.fetch("notes")
    @encounter.location_id = params.fetch("location_id")
    @encounter.approving_provider_id = params.fetch("approving_provider_id")

    if @encounter.valid?
      @encounter.save

      redirect_to("/encounters/#{@encounter.id}", :notice => "Encounter updated successfully.")
    else
      render("encounter_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_provider
    @encounter = Encounter.find(params.fetch("id_to_remove"))

    @encounter.destroy

    redirect_to("/providers/#{@encounter.provider_id}", notice: "Encounter deleted successfully.")
  end

  def destroy_row_from_approving_provider
    @encounter = Encounter.find(params.fetch("id_to_remove"))

    @encounter.destroy

    redirect_to("/providers/#{@encounter.approving_provider_id}", notice: "Encounter deleted successfully.")
  end

  def destroy_row_from_patient
    @encounter = Encounter.find(params.fetch("id_to_remove"))

    @encounter.destroy

    redirect_to("/patients/#{@encounter.patient_id}", notice: "Encounter deleted successfully.")
  end

  def destroy_row_from_location
    @encounter = Encounter.find(params.fetch("id_to_remove"))

    @encounter.destroy

    redirect_to("/locations/#{@encounter.location_id}", notice: "Encounter deleted successfully.")
  end

  def destroy_row
    @encounter = Encounter.find(params.fetch("id_to_remove"))

    @encounter.destroy

    redirect_to("/encounters", :notice => "Encounter deleted successfully.")
  end
end
