require './environment'
require_relative 'app/models/pirate.rb'
require_relative 'app/models/ship.rb'

module FormsLab
  class App < Sinatra::Base
    # set :views, "app/views/"

    get '/' do
      erb :root
    end

    get '/new' do
      erb :"pirates/new"
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
      params[:pirate][:ships].each do |ship_attributes|
        ship = Ship.new(ship_attributes)
      end
      @ships<<ship
      erb :"/pirates/show"
    end

    # code other routes/actions here

  end
end
