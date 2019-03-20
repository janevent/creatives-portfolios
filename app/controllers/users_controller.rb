class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    @users = User.all
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    if !params[:user][:artist_name].empty? && !params[:user][:email].empty? && !params[:user][:password].empty? && !params[:user][:artist_statement].empty?
      @user = User.create(artist_name: params[:user][:artist_name], email: params[:user][:email], password: params[:user][:password], artist_statement: params[:user][:artist_statement])
      session[:user_id] = @user.id
      redirect "/users"
    else
      redirect "/users/new"
    end
  end

  get '/users/login' do
     if !logged_in?
         @user = User.new
         erb :"/users/login.html"
     else
         redirect "/users"
     end

 end

post '/users/login' do
  #raise params.inspect
 
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "users/#{@user.id}"
    
  else 
    redirect "/users/login"
  end
end

get "/users/logout" do 
  session.clear
  redirect "/users"
end

  # GET: /users/5
  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    if logged_in?
      @user = User.find(params[:id])
      erb :"/users/edit.html"
    else 
      redirect "/users/login"
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    
    if logged_in?
      if params[:user][:email] != "" && params[:user][:password] != ""
        @user = User.find(params[:id])
        @user.update(artist_name: params[:user][:artist_name], email: params[:user][:email], artist_statement: params[:user][:artist_statement])
        redirect "/users/#{@user.id}"
      else 
        redirect "/users/#{params[:id]/edit}"
      end
      
    else 
      redirect "/users/login"
    end
  end

  get "/users/:id/art_objects" do
    @user = User.find(params[:id])
    @art_objects = @user.art_objects
    erb :"/users/art_objects.html"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    @user = User.find(params[:id])
    @user.destroy
    redirect "/users"
  end
end
