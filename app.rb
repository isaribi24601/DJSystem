require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'sinatra/json'

require './models/songs.rb'

#    set :bind, '192.168.33.10'
#    set :port, 3000


get '/' do
  'Hello Sintra!'
  @contents = Song.order("id desc").all
  erb :index

end

post '/dj' do

  logger.info "URL：#{params[:url]}"
  url = params[:url]
  # urlを分割して、IDだけを取り出す

  video_id = url.split("=")[1]
  Song.create(:url => video_id)

  redirect '/'

end

get '/api/dj' do
  # Songから最初の１件を取り出す
  data = Song.first[:url]
  p data
  data
end




