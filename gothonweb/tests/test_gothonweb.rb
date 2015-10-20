require "./bin/app.rb"
require "test/unit"
require "rack/test"

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index_redirect
    get '/'
    follow_redirect!
    assert last_response.body.include?('Central Corridor')
  end

  def test_game_post
    test_index_redirect

    post '/game', params={action: 'tell a joke'}
    follow_redirect!
    assert last_response.ok?
    assert last_response.body.include?('Laser Weapon Armory')
  end

  def test_game_ending
    post '/game', params={action: '2'},
        env={'rack.session' => {'room': 'ESCAPE_POD'}}
    follow_redirect!
    assert last_response.ok?
    assert last_response.body.include?("You won!")
  end
end
