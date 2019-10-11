require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'dentist'
  end

  get "/" do
    erb :welcome
  end

  # get '/signup' do
  #   if logged_in?
  #     session.clear
  #     erb :signup
  #   else
  #     erb :signup
  #   end
  # end

  # post '/signup' do
  #   @dentist = Dentist.new(
  #         name: params[:name], 
  #         username: params[:username], 
  #         email: params[:email], 
  #         password: params[:password]
  #         )
  #   if @dentist.save
  #     session[:dentist_id] = @dentist.id
  #     redirect '/login'
  #   else
  #     puts "You need to signup"
  #     redirect '/signup'
  #   end
  # end

  # get '/login' do
  #   if logged_in?
  #     # flash[:message] = "You are already logged in."
  #     redirect to "/dentists/index.html"
  #   else
  #     erb :login
  #   end
  # end

  # post '/login' do
  #   @user = User.find_by(username: params[:user][:username])
  #   if @user && @user.authenticate(params[:user][:password])
  #     session[:user_id] = @user.id
  #     redirect '/'
  #   else
  #     flash[:message] = "Invalid username or/and password. Please try again."
  #     redirect '/login'
  #   end
  # end

  # post '/logout' do
  #   session.clear
  #   redirect '/'
  # end


  helpers do
    def logged_in?
      !!session[:dentist_id]
    end

    def current_user
      Dentist.find(session[:dentist_id])
    end
  end

end
