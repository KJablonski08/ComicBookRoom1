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
        u.comics.build(title: params[:title], series: params[:series], issue: params[:issue], author: params[:author], details: params[:details], anonymous?: !!params[:anonymous?], public?: !!params[:public?])
        if u.save 
            redirect '/comics'
        else 
            @messages = "There was trouble submitting your form"
            erb :'/comics/new'
        end 
    end 

    get '/comics/:id' do
        authenticate
		@comic = Comic.find(params[:id])
		erb :"comics/show"
    end

    get '/comics/:id/edit' do
        authenticate 
        @comic = Comic.find(params[:id])
        if @comic.user == current_user
            erb :'comics/edit'
        else 
            redirect '/comics'
        end
    end 

    patch '/comics/:id' do 
        @comic = Comic.find(params[:id])
        if @comic.update(title: params[:title], series: params[:series], issue: params[:issue], author: params[:author], details: params[:details], anonymous?: !!params[:anonymous?], public?: !!params[:public?])
            redirect 'comics'
        else 
            redirect 'comics/#{@comic.id}/edit'
        end 
    end 

    get '/comics/:id/delete' do
        authenticate
        @comic = Comic.find(params[:id])
        erb :'comics/delete'
    end 

    delete '/comics/:id/delete' do 
        comic = Comic.find(params[:id])
        comic.destroy
        redirect '/comics'
    end 

end  