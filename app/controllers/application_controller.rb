class ApplicationController < Sinatra::Base

    configure do 
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions 
        set :session_secret, SESSION_SECRET
    end 

    get '/' do 
        "Hello World"
        erb :index
    end  

    helpers do 

        def logged_in? 
            !!current_user
        end 

        def current_user 
            User.find_by(id: sessions[:user_id])
        end 

    end 
end 