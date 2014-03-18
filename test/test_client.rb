require File.dirname(__FILE__) + '/helper'

require 'prx/client'
require 'prx/model'

class PRX::TestClient < Test::Unit::TestCase
  
  def setup 
    PRX::Client.key     = 'WlziaXf34NighkX24LjnE9JgpEmEQkP8nWkBmh9J'
    PRX::Client.secret  = 'iuUWEb3AfS5DQiOVpqH1juAacQ0vr3aIhNGWfIW9'
    PRX::Client.host    = "development.prx.org"
    PRX::Client.port    = 3001
    PRX::Client.version = 'v2'
    PRX::Client.token   = 'iW7qgZSQq4ryQRks1G57X7B1appJLOWeF4yZz6jn'

    @user_info = {
      :uid      => '1001',
      :provider => 'PRX',
      :info     => {
        :id         => '1001',
        :login      => 'test_login',
        :email      => 'test@prx.org',
        :first_name => 'first',
        :last_name  => 'last'
      }
    }
  end

  def test_me
    stub_request(:get, "http://development.prx.org:3001/me").
      with(:headers => {'Authorization'=>'Bearer iW7qgZSQq4ryQRks1G57X7B1appJLOWeF4yZz6jn', 'Host'=>'development.prx.org:3001', 'User-Agent'=>'Faraday v0.8.9'}).
      to_return(:status => 200, :body => @user_info.to_json, :headers => {})

    response = PRX::Model::User.me
    # puts response.parsed.inspect
  end

  def test_piece_create_with_local_file
    p = PRX::Model::Piece.new(:title=>'test title',
                              :short_description=>'test short description',
                              :description=>'test description',
                              :account=>PRX::Model::Account.new(:id=>8),
                              :producers=>[PRX::Model::Producer.new(:name=>'Producer')])
                              
    p.add_audio(:label=>'test', :attach_file=>"#{File.dirname(__FILE__)}/files/test.mp2", :content_type=>'audio/mpeg')
    # puts p.inspect

    stub_request(:post, "http://development.prx.org:3001/api/v2/pieces").
      to_return(
        :status => 200,
        :body => "{\"short_description\":\"Episode 12345 of the new Public Radio Remix Select series. Based on Remix 24 episode 54321.\",\"length\":0,\"series\":{\"title\":\"Public Radio Remix Select\",\"id\":32346},\"creator\":{\"first_name\":\"PRX\",\"last_name\":\"Administrator\",\"login\":\"admin\",\"email\":\"admin@prx.org\",\"id\":8},\"publish_on_valid\":true,\"description\":\"this is the description, and it is very long\",\"license\":{\"allow_edit\":\"only with permission\",\"id\":169778,\"website_usage\":\"as a free MP3 download and stream\"},\"promos\":{\"label\":\"Promos\",\"id\":200467,\"audio_files\":[]},\"point_level\":0,\"account_id\":98822,\"title\":\"Remix Select: Episode 12345\",\"id\":88474,\"is_shareable\":true,\"allow_comments\":true,\"episode_number\":12345,\"networks\":[{\"id\":23,\"path\":\"remix-select\",\"name\":\"Public Radio Remix Select\"}],\"account\":{\"id\":98822,\"type\":\"Group\",\"path\":\"remix\",\"name\":\"Public Radio Remix\"},\"network_only\":true,\"producers\":[{\"user\":{\"first_name\":\"PRX\",\"last_name\":\"Administrator\",\"login\":\"admin\",\"email\":\"admin@prx.org\",\"id\":8},\"id\":100458}],\"audio_versions\":[{\"label\":\"Piece Audio\",\"id\":200467,\"audio_files\":[]}],\"created_at\":\"2014-03-18T10:20:11-04:00\"}",
        :headers => {"Content-Length"=>"1118", "Set-Cookie"=>"_prx_session_development=BAh7BzoPc2Vzc2lvbl9pZCIlZDk1NGFmZWQzNDhkZDI4ZDBmMmEzN2YwMzhmZjRiODc6DHVzZXJfaWRpDQ%3D%3D--c307c1d85dacd9d35aead604008e10064684065f; path=/; HttpOnly", "ETag"=>"\"7444da1c82c7cac604f9bc2b94cd6e7b\"", "Cache-Control"=>"private, max-age=0, must-revalidate", "Content-Type"=>"application/json; charset=utf-8", "X-Runtime"=>"985", "Connection"=>"keep-alive"}
      )

    response = PRX::Client.request({:action => :post, :path => 'pieces', :body => p.as_json})

    assert response

    # puts response.parsed.inspect
  end

  def test_piece_create_with_remote_url
    p = PRX::Model::Piece.new(:title=>'test title', :short_description=>'test short description', :description=>'test description', :account_id=>8)
    p.add_audio(:label=>'test', :attach_file=>'s3://andrew-s3.prx.org/public/audio_files/118091/Baronowski.mp2')
    # puts p.inspect


    stub_request(:post, "http://development.prx.org:3001/api/v2/pieces").
      to_return(
        :status => 200,
        :body => "{\"short_description\":\"Episode 12345 of the new Public Radio Remix Select series. Based on Remix 24 episode 54321.\",\"length\":0,\"series\":{\"title\":\"Public Radio Remix Select\",\"id\":32346},\"creator\":{\"first_name\":\"PRX\",\"last_name\":\"Administrator\",\"login\":\"admin\",\"email\":\"admin@prx.org\",\"id\":8},\"publish_on_valid\":true,\"description\":\"this is the description, and it is very long\",\"license\":{\"allow_edit\":\"only with permission\",\"id\":169778,\"website_usage\":\"as a free MP3 download and stream\"},\"promos\":{\"label\":\"Promos\",\"id\":200467,\"audio_files\":[]},\"point_level\":0,\"account_id\":98822,\"title\":\"Remix Select: Episode 12345\",\"id\":88474,\"is_shareable\":true,\"allow_comments\":true,\"episode_number\":12345,\"networks\":[{\"id\":23,\"path\":\"remix-select\",\"name\":\"Public Radio Remix Select\"}],\"account\":{\"id\":98822,\"type\":\"Group\",\"path\":\"remix\",\"name\":\"Public Radio Remix\"},\"network_only\":true,\"producers\":[{\"user\":{\"first_name\":\"PRX\",\"last_name\":\"Administrator\",\"login\":\"admin\",\"email\":\"admin@prx.org\",\"id\":8},\"id\":100458}],\"audio_versions\":[{\"label\":\"Piece Audio\",\"id\":200467,\"audio_files\":[]}],\"created_at\":\"2014-03-18T10:20:11-04:00\"}",
        :headers => {"Content-Length"=>"1118", "Set-Cookie"=>"_prx_session_development=BAh7BzoPc2Vzc2lvbl9pZCIlZDk1NGFmZWQzNDhkZDI4ZDBmMmEzN2YwMzhmZjRiODc6DHVzZXJfaWRpDQ%3D%3D--c307c1d85dacd9d35aead604008e10064684065f; path=/; HttpOnly", "ETag"=>"\"7444da1c82c7cac604f9bc2b94cd6e7b\"", "Cache-Control"=>"private, max-age=0, must-revalidate", "Content-Type"=>"application/json; charset=utf-8", "X-Runtime"=>"985", "Connection"=>"keep-alive"}
      )

    response = PRX::Client.request({:action => :post, :path => 'pieces', :body => p.as_json})

    assert response

    # puts response.parsed.inspect
  end

end
