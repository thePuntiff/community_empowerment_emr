class SexesController < ApplicationController
  def index
    @sexes = Sex.page(params[:page]).per(10)

    render("sex_templates/index.html.erb")
  end

  def show
    @patient = Patient.new
    @sex = Sex.find(params.fetch("id_to_display"))

    render("sex_templates/show.html.erb")
  end

  def new_form
    @sex = Sex.new

    render("sex_templates/new_form.html.erb")
  end

  def create_row
    @sex = Sex.new

    @sex.name = params.fetch("name")

    if @sex.valid?
      @sex.save

      redirect_back(:fallback_location => "/sexes", :notice => "Sex created successfully.")
    else
      render("sex_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @sex = Sex.find(params.fetch("prefill_with_id"))

    render("sex_templates/edit_form.html.erb")
  end

  def update_row
    @sex = Sex.find(params.fetch("id_to_modify"))

    @sex.name = params.fetch("name")

    if @sex.valid?
      @sex.save

      redirect_to("/sexes/#{@sex.id}", :notice => "Sex updated successfully.")
    else
      render("sex_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @sex = Sex.find(params.fetch("id_to_remove"))

    @sex.destroy

    redirect_to("/sexes", :notice => "Sex deleted successfully.")
  end
end
