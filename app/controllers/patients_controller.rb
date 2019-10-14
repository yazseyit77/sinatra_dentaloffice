class PatientsController < ApplicationController

  # GET: /patients
  get "/patients" do
    @patients = Patient.all
    erb :"/patients/index.html"
    # if logged_in?
    #   @dentist = current_user
    #   @patients = Patient.where(dentist_id: session[:dentist_id])
    #   erb :"/patients/index.html"
    # else
    #   redirect "/dentists/login"
    # end
  end

  # GET: /patients/new
  get "/patients/new" do
    erb :"/patients/new.html"
  end

  # POST: /patients
  post "/patients" do
    @patient = Patient.new(
      name: params[:name], 
      adress: params[:adress], 
      email: params[:email], 
      phone: params[:phone],
      description: params[:description]
      )
      @patient.save
      # binding.pry
     redirect "/patients"
  end

  # GET: /patients/5
  get "/patients/:id" do
    erb :"/patients/index.html"
  end

  # GET: /patients/5/edit
  get "/patients/:id/edit" do
    @patient = Patient.find_by(id: params[:id])
    erb :"/patients/edit.html"
  end

  # PATCH: /patients/5
  patch "/patients/:id" do
    @patient = Patient.find_by(id: params[:id])
    @patient.update(params[:patient])
    redirect "/patients"
  end

  # DELETE: /patients/5/delete
  delete "/patients/:id" do
    @patient = Patient.find_by(id: params[:id])
    @patient.destroy
    redirect "/patients"
  end
end
