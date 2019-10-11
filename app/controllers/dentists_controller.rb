class DentistsController < ApplicationController

  # GET: /dentists
  get "/dentists" do
    erb :"/dentists/index.html"
  end

  # GET: /dentists/new
  get "/dentists/new" do
    erb :"/dentists/new.html"
  end

  # POST: /dentists
  post "/dentists" do
    redirect "/dentists"
  end

  # GET: /dentists/5
  get "/dentists/:id" do
    erb :"/dentists/show.html"
  end

  # GET: /dentists/5/edit
  get "/dentists/:id/edit" do
    erb :"/dentists/edit.html"
  end

  # PATCH: /dentists/5
  patch "/dentists/:id" do
    redirect "/dentists/:id"
  end

  # DELETE: /dentists/5/delete
  delete "/dentists/:id/delete" do
    redirect "/dentists"
  end
end
