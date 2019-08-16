class ComicsController < ApplicationController 

    get '/comics' do 
        authenticate 
        @comics = Comic.all 
        erb :'comics/index'
    end 

    get '/comics/:id' do 
        @comic = Comic.find(params[:id])
        erb :'comics/show.html'
    end 

end  