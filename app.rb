require 'sinatra'
require 'rubygems'

get '/' do
  erb :index
end

get '/rules' do
  @title = 'Tic Tac Toe Rules'
  erb :rules
end

get '/playgame' do
	#@title = 'Play Tic Tac Toe!'
	erb :playgame
end

get '/minedminds' do
	#@title = 'Mined Minds'
	erb :minedminds
end