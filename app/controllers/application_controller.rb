class ApplicationController < Sinatra::Base

    configure do 
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions 
        set :session_secret, SESSION_SECRET
    end 

    get '/' do 
        erb :index
    end  

    get '/home' do
        authenticate 
        erb :home
    end 

    helpers do 

        def logged_in? 
            !!current_user
        end 

        def current_user 
            User.find_by(id: session[:user_id])
        end 

        def authenticate 
            if !logged_in?
                redirect '/login' 
            end 
        end 

        def authenticate_user(comic)
            authenticate
            redirect '/home' if !comic
            redirect '/home' if current_user != @comic.user
        end 
    
    end 
end 