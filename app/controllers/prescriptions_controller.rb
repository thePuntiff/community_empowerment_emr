class PrescriptionsController < ApplicationController
  def index
    @q = Prescription.ransack(params[:q])
    @prescriptions = @q.result(:distinct => true).includes(:provider, :patient, :encounter, :medication, :med_type).page(params[:page]).per(10)

    render("prescription_templates/index.html.erb")
  end

  def show
    @prescription = Prescription.find(params.fetch("id_to_display"))

    render("prescription_templates/show.html.erb")
  end

  def new_form
    @prescription = Prescription.new

    render("prescription_templates/new_form.html.erb")
  end

  def create_row
    @prescription = Prescription.new

    @prescription.patient_id = params.fetch("patient_id")
    @prescription.provider_id = params.fetch("provider_id")
    @prescription.encounter_id = params.fetch("encounter_id")
    @prescription.medication_id = params.fetch("medication_id")

    if @prescription.valid?
      @prescription.save

      redirect_back(:fallback_location => "/prescriptions", :notice => "Prescription created successfully.")
    else
      render("prescription_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_patient
    @prescription = Prescription.new

    @prescription.patient_id = params.fetch("patient_id")
    @prescription.provider_id = params.fetch("provider_id")
    @prescription.encounter_id = params.fetch("encounter_id")
    @prescription.medication_id = params.fetch("medication_id")

    if @prescription.valid?
      @prescription.save

      redirect_to("/patients/#{@prescription.patient_id}", notice: "Prescription created successfully.")
    else
      render("prescription_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_encounter
    @prescription = Prescription.new

    @prescription.patient_id = params.fetch("patient_id")
    @prescription.provider_id = params.fetch("provider_id")
    @prescription.encounter_id = params.fetch("encounter_id")
    @prescription.medication_id = params.fetch("medication_id")

    if @prescription.valid?
      @prescription.save

      redirect_to("/encounters/#{@prescription.encounter_id}", notice: "Prescription created successfully.")
    else
      render("prescription_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_medication
    @prescription = Prescription.new

    @prescription.patient_id = params.fetch("patient_id")
    @prescription.provider_id = params.fetch("provider_id")
    @prescription.encounter_id = params.fetch("encounter_id")
    @prescription.medication_id = params.fetch("medication_id")

    if @prescription.valid?
      @prescription.save

      redirect_to("/medications/#{@prescription.medication_id}", notice: "Prescription created successfully.")
    else
      render("prescription_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @prescription = Prescription.find(params.fetch("prefill_with_id"))

    render("prescription_templates/edit_form.html.erb")
  end

  def update_row
    @prescription = Prescription.find(params.fetch("id_to_modify"))

    @prescription.patient_id = params.fetch("patient_id")
    
    @prescription.encounter_id = params.fetch("encounter_id")
    @prescription.medication_id = params.fetch("medication_id")

    if @prescription.valid?
      @prescription.save

      redirect_to("/prescriptions/#{@prescription.id}", :notice => "Prescription updated successfully.")
    else
      render("prescription_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_provider
    @prescription = Prescription.find(params.fetch("id_to_remove"))

    @prescription.destroy

    redirect_to("/providers/#{@prescription.provider_id}", notice: "Prescription deleted successfully.")
  end

  def destroy_row_from_patient
    @prescription = Prescription.find(params.fetch("id_to_remove"))

    @prescription.destroy

    redirect_to("/patients/#{@prescription.patient_id}", notice: "Prescription deleted successfully.")
  end

  def destroy_row_from_encounter
    @prescription = Prescription.find(params.fetch("id_to_remove"))

    @prescription.destroy

    redirect_to("/encounters/#{@prescription.encounter_id}", notice: "Prescription deleted successfully.")
  end

  def destroy_row_from_medication
    @prescription = Prescription.find(params.fetch("id_to_remove"))

    @prescription.destroy

    redirect_to("/medications/#{@prescription.medication_id}", notice: "Prescription deleted successfully.")
  end

  def destroy_row
    @prescription = Prescription.find(params.fetch("id_to_remove"))

    @prescription.destroy

    redirect_to("/prescriptions", :notice => "Prescription deleted successfully.")
  end
end
