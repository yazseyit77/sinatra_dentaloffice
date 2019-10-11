require 'rack-flash'

class DentistsController < ApplicationController
  use Rack::Flash

  # GET: /dentists
  get "/dentists/show" do
    @dentist = Dentist.all
    erb :"/dentists/show"
  end

  # GET: /dentists/new
  get "/dentists/new" do
    erb :"/dentists/new.html"
  end

  # POST: /dentists
  post "/dentists" do
    @dentist = Dentist.new(
      name: params[:name], 
      username: params[:username], 
      email: params[:email], 
      password: params[:password]
      )
      if @dentist.save
        # binding.pry
        session[:dentist_id] = @dentist.id
     
        redirect "/dentists/#{@dentist.id}"
      else
        redirect "/dentists/new"
      end  
  end

    # GET: /dentists/5
    get "/dentists/:id" do
      erb :"/dentists/index.html"
    end
  

  get "/dentists/login" do
    if logged_in?
      flash[:message] = "You are logged in!"
      redirect "/dentists/index.html"
    else
      erb :"/dentists/login.html"
    end
  end

  post "/dentists/login" do
    @dentist = Dentist.find_by(username: params[:dentist][:username])
    if @dentist
      redirect to "/dentists/#{@dentist.id}"
    else 
      redirect "/dentists/login.html"
    end
  end


  # GET: /dentists/5/edit
  get "/dentists/:id/edit" do
    @dentists = Dentist.find_by(id: params[:id])
    erb :"/dentists/edit.html"
  end

  # PATCH: /dentists/5
  patch "/dentists/:id" do
    @dentists = Dentist.find_by(id: params[:id])
    @dentists.update(params[:dentists])
    redirect "/dentists/show"
  end

  # DELETE: /dentists/5/delete
  delete "/dentists/:id" do
    @dentists = Dentist.find_by(id: params[:id])
    @dentists.destroy
    redirect "/dentists/show"
  end
end
