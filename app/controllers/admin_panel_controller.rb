class AdminPanelController < ApplicationController

  def index
    render("admin_templates/index.html.erb")
  end
  
end
