ENV['RACK_ENV'] = 'test'
require './app'
require 'minitest/autorun'
require 'rack/test'
require 'tilt/erb'
#require_relative 'app.rb'


class MyTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end


  def test_for_index_erb
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('slideshowimages("mm.png","rules.png","ttt.png")')
    assert last_response.body.include?('slideshowlinks("http://localhost:4567/minedminds","http://localhost:4567/rules","http://localhost:4567/playgame","","")')
    assert last_response.body.include?('class="active"href="http://localhost:4567/">Home')
  end
  

  def test_it_redirects_to_rules_erb
    get '/rules'
    assert last_response.ok?
    assert last_response.body.include?('IMG SRC="rules.png"')
    assert last_response.body.include?('"https://en.wikipedia.org/wiki/Tic-tac-toe#Strategy"')
    assert last_response.body.include?('class="active"href="http://localhost:4567/rules">Rules')
    assert_equal "http://example.org/rules",last_request.url
  end

  
  def test_it_redirects_to_playgame_erb
    get '/playgame'
    assert last_response.ok?
    assert_equal "http://example.org/playgame",last_request.url
    assert last_response.body.include?('class="active"href="http://localhost:4567/playgame">Play Game')
    assert last_response.body.include?('slideshowimages("ttt.png")')
  end

  def test_it_redirects_to_minedminds_erb
    get '/minedminds'
    assert last_response.ok?
    assert_equal "http://example.org/minedminds",last_request.url
    assert last_response.body.include?('class="active" href="http://localhost:4567/minedminds">Mined Minds')
    assert last_response.body.include?('IMG SRC="mm.png"')
    #assert_equal '"https://www.facebook.com/MinedMinds"', last_response.body
  end

  def test_for_pictures1
    get '/minedminds'
    pictures = load_pictures
    assert pictures.length > 0, "There are no pictures" #message displayed when assertion is false
  end
  
  def test_for_pictures2
    get '/playgame'
    pictures = load_pictures
    assert pictures.length > 0, "There are no pictures" #message displayed when assertion is false 
  end

  def test_for_pictures3
    get '/rules'
    pictures = load_pictures
    assert pictures.length > 0, "There are no pictures" #message displayed when assertion is false 
  end

  def test_for_pictures4
    get '/index'
    pictures = load_pictures
    assert pictures.length > 0, "There are no pictures" #message displayed when assertion is false 
  end


end






