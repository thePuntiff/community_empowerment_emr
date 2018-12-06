class PatientsController < ApplicationController
  def index
    @q = Patient.ransack(params[:q])
    @patients = @q.result(:distinct => true).includes(:encounters, :prescriptions, :sex).page(params[:page]).per(10)

    render("patient_templates/index.html.erb")
  end

  def show
    @prescription = Prescription.new
    @encounter = Encounter.new
    @patient = Patient.find(params.fetch("id_to_display"))

    render("patient_templates/show.html.erb")
  end

  def new_form
    @patient = Patient.new

    render("patient_templates/new_form.html.erb")
  end

  def create_row
    @patient = Patient.new

    @patient.firstname = params.fetch("firstname")
    @patient.lastname = params.fetch("lastname")
    @patient.sex_id = params.fetch("sex_id")
    @patient.dob = params.fetch("dob")
    @patient.phone_num = params.fetch("phone_num")

    if @patient.valid?
      @patient.save

      redirect_to("/patients/#{@patient.id}", notice: "Patient created successfully.")
      
    else
      render("patient_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_sex
    @patient = Patient.new

    @patient.firstname = params.fetch("firstname")
    @patient.lastname = params.fetch("lastname")
    @patient.sex_id = params.fetch("sex_id")
    @patient.dob = params.fetch("dob")
    @patient.phone_num = params.fetch("phone_num")

    if @patient.valid?
      @patient.save

      redirect_to("/sexes/#{@patient.sex_id}", notice: "Patient created successfully.")
    else
      render("patient_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @patient = Patient.find(params.fetch("prefill_with_id"))

    render("patient_templates/edit_form.html.erb")
  end

  def update_row
    @patient = Patient.find(params.fetch("id_to_modify"))

    @patient.firstname = params.fetch("firstname")
    @patient.lastname = params.fetch("lastname")
    @patient.sex_id = params.fetch("sex_id")
    @patient.dob = params.fetch("dob")
    @patient.phone_num = params.fetch("phone_num")

    if @patient.valid?
      @patient.save

      redirect_to("/patients/#{@patient.id}", :notice => "Patient updated successfully.")
    else
      render("patient_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_sex
    @patient = Patient.find(params.fetch("id_to_remove"))

    @patient.destroy

    redirect_to("/sexes/#{@patient.sex_id}", notice: "Patient deleted successfully.")
  end

  def destroy_row
    @patient = Patient.find(params.fetch("id_to_remove"))

    @patient.destroy

    redirect_to("/patients", :notice => "Patient deleted successfully.")
  end
end
