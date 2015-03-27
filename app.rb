require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'json'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')

require './models/songs.rb'

    set :bind, '192.168.33.10'
    set :port, 3000


get '/' do
    'Hello Sintra!'
    @contents = Song.order("id desc").all
    erb :index
    
end

get '/post' do
    erb :post
    
end

post '/dj' do
    logger.info "URL：#{params[:url]}"
  url = params[:url]
  # urlを分割して、IDだけを取り出す

 video_id = url.split("=")[1]
 Song.create(:url => video_id)

redirect '/post'
    
end

get '/api/dj' do
    # Songから最初の１件を取り出す
   data = Song.first[:url]
    Song.first.destroy
    p data
    data
    
end

post '/api/deletesong' do
    
    song = Song.where(url: params[:videoId]).first.destroy
    
end

get '/api/redirect' do
    
    redirect '/'
    
end
    