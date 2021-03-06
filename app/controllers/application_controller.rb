require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'silly' #ENV.fetch('SESSION_SECRET')
  end



  get "/" do
    erb :welcome
  end

  helpers do 
    def logged_in?
      !!current_user
    end
    
    def current_user
      if session[:user_id]
        User.find_by_id(session[:user_id])
      end
    end
  end

end
