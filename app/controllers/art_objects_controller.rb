class ArtObjectsController < ApplicationController

  # GET: /art_objects
  get "/art_objects" do
    @art_objects = ArtObject.all
    erb :"/art_objects/index.html"
  end

  # GET: /art_objects/new
  get "/art_objects/new" do
    if logged_in?
      @art_object = ArtObject.new
      erb :"/art_objects/new.html"
    else 
      redirect "/users/login"
    end
  end

  # POST: /art_objects
  #
  post "/art_objects" do
    redirect "/users/login" unless logged_in?
    @art_object = current_user.art_objects.build(title: params[:art_object][:title], date: params[:art_object][:date], form: params[:art_object][:form], description: params[:art_object][:description])
    if !params[:art_object][:title].empty?
  
      if "#{params[:art_object][:image]}" =~/.|.(png|jpeg|jpg|gif)$/ 
        @art_object.image = params[:art_object][:image]
       
      end
      @art_object.save
      redirect "/art_objects"
    else
      @error = "You do not have a title."
      erb :"/art_objects/new.html"
    end
  end

  # GET: /art_objects/5
  get "/art_objects/:id" do
    
    @art_object = ArtObject.find(params[:id])
    if @art_object && session[:user_id] == @art_object.user_id
      erb :"/art_objects/show.html"
    else 
      redirect "/art_objects"
    end
  end

  # GET: /art_objects/5/edit
  get "/art_objects/:id/edit" do
    @art_object = ArtObject.find(params[:id])
    if logged_in? && current_user.id == @art_object.user_id 
      @art_object = ArtObject.find(params[:id])
      erb :"/art_objects/edit.html"
    else
      redirect "/art_objects"
    end
  end

  # PATCH: /art_objects/5
  patch "/art_objects/:id" do
    #binding.pry
    if logged_in?
      
      @art_object = ArtObject.find(params[:id])
      @art_object.update(title: params[:art_object][:title], image: params[:art_object][:image], date: params[:art_object][:date], form: params[:art_object][:form], description: params[:art_object][:description])
  
      if "#{params[:art_object][:image]}" =~/.|.(png|jpeg|jpg|gif)$/
        @art_object.update(image: params[:art_object][:image])
    
        
        redirect "/art_objects/#{@art_object.id}"
      else
        redirect "/art_objects/#{@art_object.id}"
      end
    else
       "/users/login"
    end
  end

  # DELETE: /art_objects/5/delete
  delete "/art_objects/:id/delete" do
    @art_object = ArtObject.find(params[:id])
    if logged_in? && current_user.id == @art_object.user.id
      @art_object.destroy
      redirect "/art_objects"
    else 
      redirect "/art_objects"
    end
  end
end
