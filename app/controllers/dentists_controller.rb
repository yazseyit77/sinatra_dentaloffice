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
    if logged_in?
      session.clear
      erb :"dentists/index.html"
    else
    erb :"/dentists/new.html"
    end
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
        session[:dentist_id] = @dentist.id
        # redirect "/dentists/#{@dentist.id}"
        redirect "/dentists/login"
      else
        redirect "/dentists/new.html"
      end  
  end

   
    get "/dentists/login" do
      if logged_in?
        @dentist = current_user
        redirect "/dentists/index.html"
      else
        erb :"/dentists/login"
      end
    end

    post "/dentists/login" do
      @dentist = Dentist.find_by(username: params[:username])
      if @dentist
        redirect to "/dentists/#{@dentist.id}"
      else 
        redirect "/dentists/login"
      end
    end

  # GET: /dentists/5
  get "/dentists/:id" do
    erb :"/dentists/index.html"
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
