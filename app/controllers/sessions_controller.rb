class SessionsController < ApplicationController

    get '/login' do
        redirect '/comics' if logged_in?
        @failed = false 
        erb :'sessions/login'
    end 

    post '/login' do 
        user = User.find_by(username: params[:username])
        if !!user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/comics'
        else 
            @failed = true 
            erb :'sessions/login'    
        end 
    end 

    get '/signup' do 
        redirect '/comics' if logged_in?
        erb :'sessions/signup'
    end 

end  