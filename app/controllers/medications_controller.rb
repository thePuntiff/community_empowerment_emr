class MedicationsController < ApplicationController
  def index
    @medications = Medication.all

    render("medication_templates/index.html.erb")
  end

  def show
    @prescription = Prescription.new
    @medication = Medication.find(params.fetch("id_to_display"))

    render("medication_templates/show.html.erb")
  end

  def new_form
    @medication = Medication.new

    render("medication_templates/new_form.html.erb")
  end

  def create_row
    @medication = Medication.new

    @medication.name = params.fetch("name")
    @medication.med_type_id = params.fetch("med_type_id")

    if @medication.valid?
      @medication.save

      redirect_back(:fallback_location => "/medications", :notice => "Medication created successfully.")
    else
      render("medication_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_med_type
    @medication = Medication.new

    @medication.name = params.fetch("name")
    @medication.med_type_id = params.fetch("med_type_id")

    if @medication.valid?
      @medication.save

      redirect_to("/med_types/#{@medication.med_type_id}", notice: "Medication created successfully.")
    else
      render("medication_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @medication = Medication.find(params.fetch("prefill_with_id"))

    render("medication_templates/edit_form.html.erb")
  end

  def update_row
    @medication = Medication.find(params.fetch("id_to_modify"))

    @medication.name = params.fetch("name")
    @medication.med_type_id = params.fetch("med_type_id")

    if @medication.valid?
      @medication.save

      redirect_to("/medications/#{@medication.id}", :notice => "Medication updated successfully.")
    else
      render("medication_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_med_type
    @medication = Medication.find(params.fetch("id_to_remove"))

    @medication.destroy

    redirect_to("/med_types/#{@medication.med_type_id}", notice: "Medication deleted successfully.")
  end

  def destroy_row
    @medication = Medication.find(params.fetch("id_to_remove"))

    @medication.destroy

    redirect_to("/medications", :notice => "Medication deleted successfully.")
  end
end
