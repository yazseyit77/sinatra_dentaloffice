class DentistsController < ApplicationController
  enable :sessions

  # GET: /dentists
  get "/dentists/show" do
    # if logged_in?
    #   @dentist = current_user
    #   @dentist = Dentist.where(id: session[:id])
    #   erb :"/dentists/show"
    # else
    #   redirect "/dentists/login"
    # end
    @dentist = Dentist.all
    erb :"/dentists/show"
  end

  # GET: /dentists/new
  get "/dentists/new" do
    erb :"/dentists/new.html"
  end

  # POST: /dentists
  post "/dentists" do
    @dentist = Dentist.create(
      name: params[:name], 
      username: params[:username], 
      email: params[:email], 
      password: params[:password]
      )
      if @dentist.save
        (session[:user_id] = @dentist.id)
        (redirect "/dentists/show")
      else
        redirect "/dentists/new"
      end  
  end

  get "/dentists/login" do
    @dentist = Dentist.find_by(username: params[:username])
    # if @dentist && @dentist.authenticate(params[:username])
    #   session[:dentist_id] = @dentist.id
    #   redirect "/dentists/show"
    # else
    #   erb :"/dentists/login"
    # end
    !logged_in? ? (erb :"/dentists/login") : (redirect "/dentists/show")
    # erb :"/dentists/login"
  end
   
  post "/dentists/login" do
    @dentist = Dentist.find_by(username: params[:username])
    if @dentist && @dentist.authenticate(params[:password])
      session[:user_id] = @dentist.id
      redirect "/dentists/show"
    else 
      redirect "/dentists/login"
    end
  end

    # GET: /dentists/5
  get "/dentists/:id" do
    if logged_in?
      # @dentists = Dentist.find_by(id: params[:id])
      erb :"/dentists/show"
    else
      redirect "/dentists/login"
    end
    # erb :"/dentists/show"
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

  get "/logout" do
    if logged_in? 
        session.destroy
        redirect "/dentists/login" 
    else
        redirect "/dentists/show"
    end
  end
end
