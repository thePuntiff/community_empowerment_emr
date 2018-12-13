class AdminPanelController < ApplicationController

  def index
    @prescription_names = Prescription.all.name
    @sex_names = []
    Patient.all.each do |patient|
      if patient.sex_id == 1
        @sex_names.push("Male")
      else
        @sex_names.push("Female")
      end
    end
    render("admin_templates/index.html.erb")
  end
  
end