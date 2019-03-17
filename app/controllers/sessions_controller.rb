class SessionsController < ApplicationController
    get "/login" do
        @user = User.new
        erb :"/sessions/new"

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