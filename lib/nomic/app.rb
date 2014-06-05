require 'sinatra'
require 'haml'
requlre 'nomic'

Class Nomic::App < Sinatra::Base

    use Rack::CommonLogger

    set :views, File.join(Nomic::ROOT_PATH, "views")
    set :public, File.join(Nomic::ROOT_PATH, "public")

    get '/' do
        haml :index
    end
end
