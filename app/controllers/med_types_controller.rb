class MedTypesController < ApplicationController
  def index
    @med_types = MedType.all

    render("med_type_templates/index.html.erb")
  end

  def show
    @medication = Medication.new
    @med_type = MedType.find(params.fetch("id_to_display"))

    render("med_type_templates/show.html.erb")
  end

  def new_form
    @med_type = MedType.new

    render("med_type_templates/new_form.html.erb")
  end

  def create_row
    @med_type = MedType.new

    @med_type.name = params.fetch("name")

    if @med_type.valid?
      @med_type.save

      redirect_back(:fallback_location => "/med_types", :notice => "Med type created successfully.")
    else
      render("med_type_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @med_type = MedType.find(params.fetch("prefill_with_id"))

    render("med_type_templates/edit_form.html.erb")
  end

  def update_row
    @med_type = MedType.find(params.fetch("id_to_modify"))

    @med_type.name = params.fetch("name")

    if @med_type.valid?
      @med_type.save

      redirect_to("/med_types/#{@med_type.id}", :notice => "Med type updated successfully.")
    else
      render("med_type_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @med_type = MedType.find(params.fetch("id_to_remove"))

    @med_type.destroy

    redirect_to("/med_types", :notice => "Med type deleted successfully.")
  end
end
