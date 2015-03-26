require 'sinatra'
require 'sinatra/reloader'

    set :bind, '192.168.33.10'
    set :port, 3000

get '/' do
    'Hello Sintra!'
    
end


    