class ProvidersController < ApplicationController
  def index
    @providers = Provider.page(params[:page]).per(10)

    render("provider_templates/index.html.erb")
  end

  def show
    @provider = Provider.find(params.fetch("id_to_display"))

    render("provider_templates/show.html.erb")
  end
end
