class AppointmentsController < ApplicationController

  # GET: /appointments
  get "/appointments" do
    @app = Appointment.all
    erb :"/appointments/index.html"
  end

  # GET: /appointments/new
  get "/appointments/new" do
    erb :"/appointments/new.html"
  end

  # POST: /appointments
  post "/appointments" do
    @app = Appointment.new(
      purpose: params[:purpose],
      dentist_id: params[:dentist_id],
      patient_id: params[:patient_id]
    )
    @app.save
    redirect "/appointments"
  end

  # GET: /appointments/5
  get "/appointments/:id" do
    erb :"/appointments/index.html"
  end

  # GET: /appointments/5/edit
  get "/appointments/:id/edit" do
    @app = Appointment.find_by(id: params[:id])
    erb :"/appointments/edit.html"
  end

  # PATCH: /appointments/5
  patch "/appointments/:id" do
    @app = Appointment.find_by(id: params[:id])
    @app.update(params[:appointment])
    redirect "/appointments"
  end

  # DELETE: /appointments/5/delete
  delete "/appointments/:id" do
    @app = Appointment.find_by(id: params[:id])
    @app.destroy
    redirect "/appointments"
  end
end
