class ComicsController < ApplicationController 

    get '/comics' do 
        authenticate 
        @comics = Comic.all 
        erb :'comics/index'
    end 

    post '/comics/search' do
        authenticate 
        @comics = Comic.where("series LIKE ?", "%#{params[:series]}%")
    
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
        @comic = Comic.find_by(id: params[:id])
        if @comic 
            erb :"comics/show"
        else 
            erb :error, layout: false 
        end 
    end

    #Edit 

    get '/comics/:id/edit' do
        @comic = Comic.find_by(id: params[:id])
        authenticate_user(@comic)
        if @comic
            erb :'comics/edit'
        else 
            erb :error, layout: false
        end
    end 

    patch '/comics/:id' do 
        @comic = Comic.find_by(id: params[:id])
        authenticate_user(@comic)
        if @comic.update(title: params[:title], series: params[:series], issue: params[:issue], author: params[:author], details: params[:details], anonymous?: !!params[:anonymous?], public?: !!params[:public?])
            redirect 'comics'
        else 
            erb :error, layout: false
        end 
    end 

    #Delete 

    get '/comics/:id/delete' do
        authenticate
        @comic = Comic.find(params[:id])
        erb :'comics/delete'
    end 

    delete '/comics/:id' do 
        @comic = Comic.find_by(id: params[:id])
        authenticate_user(@comic)
        if @comic
            @comic.destroy
            redirect '/comics'
        end
    end 

end  