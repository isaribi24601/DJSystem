require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require './models/songs.rb'

    set :bind, '192.168.33.10'
    set :port, 3000


get '/' do
    'Hello Sintra!'
    erb :index
    
end

post '/dj' do
    
    logger.info "URL：#{params[:url]}"
  Song.create(:url => params[:url])

redirect '/'
    
end

    