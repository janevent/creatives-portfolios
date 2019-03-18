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
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect "users/#{@user.id}"
        erb :"/users/show.html"
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
    @user = User.find_by(id: params[:id])
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    @user = User.find(params[:id])
    @user.destroy
    redirect "/users"
  end
end
