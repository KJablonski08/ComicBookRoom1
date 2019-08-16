class ComicsController < ApplicationController 

    get '/comics' do 
        authenticate 
        @comics = Comic.all 
        erb :'comics/index'
    end 

    get '/comics/new' do
        authenticate
        erb :'comics/new'
    end 

    post '/comics' do
        authenticate
        u = current_user 
        u.comics.build(title: params[:title], series: params[:series], issue: params[:issue], author: params[:author])
        if u.save 
            redirect '/comics'
        else 
            @messages = "There was trouble submitting your form"
            erb :'/comics/new'
        end 
    end 

    get '/comics/:id' do
        authenticate
		@comics = Comic.find(params[:id])
		erb :"comics/show"
	end

end  