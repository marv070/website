ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative 'app.rb'

class App_test < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # def test_for_hello_world
  #   get '/'
  #   assert last_response.ok?
  #   assert_equal 'hello world', last_response.body
  # end

  def test_it_redirects_to_erb_index
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('slideshowimages("mm.png","rules.png","ttt.png")')
  end





end






# ENV['RACK_ENV'] = 'test'

# require 'minitest/autorun'
# require 'rack/test'

# require_relative 'app.rb'

# include Rack::Test::Methods

# def app
#   Sinatra::Application
# end