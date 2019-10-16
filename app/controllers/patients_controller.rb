class PatientsController < ApplicationController

  # GET: /patients
  get "/patients" do
    # @patients = Patient.all
    # erb :"/patients/index.html"
    if logged_in?
      @patients = current_user.patients.all.sort_by{|p| p.name }
      erb :"/patients/index.html"
    else
      redirect "/dentists/login"
    end
  end

  # GET: /patients/new
  get "/patients/new" do
    if logged_in?
      erb :"/patients/new.html"
    else
      redirect "/dentists/login"
    end
  end

  # POST: /patients
  post "/patients" do
    if logged_in? 
    @patient = current_user.patients.new(
      name: params[:name], 
      adress: params[:adress], 
      email: params[:email], 
      phone: params[:phone],
      description: params[:description]
      )
      if @patient.save
        redirect "/patients"
      else
        redirect "/dentists/login"
      end
    end
  end

  # GET: /patients/5
  get "/patients/:id" do
    if logged_in?
      @patient = Patient.find_by_id(params[:id])
      erb :"/patients/index.html"
    else
      redirect "/dentists/login"
    end
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
