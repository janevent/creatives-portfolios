class SessionsController < ApplicationController
    get "/login" do
        if !logged_in?
            @user = User.new
            erb :"/sessions/new"
        else
            redirect "/users"
        end

    end

    post "/login" do 
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            erb :"/users/show"
        else 
            render :"/sessions/new"
        end
    end
end