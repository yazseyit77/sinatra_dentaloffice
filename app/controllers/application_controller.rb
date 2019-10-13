require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'my_dentist'
  end

  get "/" do
    erb :welcome
  end

  
  helpers do
    def logged_in?
      !!session[:dentist_id]
    end

    def current_user
      Dentist.find_by_id(session[:dentist_id]) if logged_in?
    end
  end

end
