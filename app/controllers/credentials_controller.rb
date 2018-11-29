class CredentialsController < ApplicationController
  def index
    @q = Credential.ransack(params[:q])
    @credentials = @q.result(:distinct => true).includes(:provider_credentials, :providers).page(params[:page]).per(10)

    render("credential_templates/index.html.erb")
  end

  def show
    @provider_credential = ProviderCredential.new
    @credential = Credential.find(params.fetch("id_to_display"))

    render("credential_templates/show.html.erb")
  end

  def new_form
    @credential = Credential.new

    render("credential_templates/new_form.html.erb")
  end

  def create_row
    @credential = Credential.new

    @credential.name = params.fetch("name")

    if @credential.valid?
      @credential.save

      redirect_back(:fallback_location => "/credentials", :notice => "Credential created successfully.")
    else
      render("credential_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @credential = Credential.find(params.fetch("prefill_with_id"))

    render("credential_templates/edit_form.html.erb")
  end

  def update_row
    @credential = Credential.find(params.fetch("id_to_modify"))

    @credential.name = params.fetch("name")

    if @credential.valid?
      @credential.save

      redirect_to("/credentials/#{@credential.id}", :notice => "Credential updated successfully.")
    else
      render("credential_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @credential = Credential.find(params.fetch("id_to_remove"))

    @credential.destroy

    redirect_to("/credentials", :notice => "Credential deleted successfully.")
  end
end
