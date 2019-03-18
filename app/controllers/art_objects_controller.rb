class ArtObjectsController < ApplicationController

  # GET: /art_objects
  get "/art_objects" do
    erb :"/art_objects/index.html"
  end

  # GET: /art_objects/new
  get "/art_objects/new" do
    erb :"/art_objects/new.html"
  end

  # POST: /art_objects
  post "/art_objects" do
    redirect "/art_objects"
  end

  # GET: /art_objects/5
  get "/art_objects/:id" do
    erb :"/art_objects/show.html"
  end

  # GET: /art_objects/5/edit
  get "/art_objects/:id/edit" do
    erb :"/art_objects/edit.html"
  end

  # PATCH: /art_objects/5
  patch "/art_objects/:id" do
    redirect "/art_objects/:id"
  end

  # DELETE: /art_objects/5/delete
  delete "/art_objects/:id/delete" do
    redirect "/art_objects"
  end
end
