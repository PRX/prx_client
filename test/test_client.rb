require File.dirname(__FILE__) + '/helper'

require 'prx/client'
require 'prx/model'
require 'fakeweb'

class PRX::TestClient < Test::Unit::TestCase
  
  # def setup 
  #   PRX::Client.key     = 'WlziaXf34NighkX24LjnE9JgpEmEQkP8nWkBmh9J'
  #   PRX::Client.secret  = 'iuUWEb3AfS5DQiOVpqH1juAacQ0vr3aIhNGWfIW9'
  #   PRX::Client.host    = "development.prx.org"
  #   PRX::Client.port    = 3000
  #   PRX::Client.version = 'v2'
  #   PRX::Client.token   = 'iW7qgZSQq4ryQRks1G57X7B1appJLOWeF4yZz6jn'

  #   user = {
  #     :uid      => '1001',
  #     :provider => 'PRX',
  #     :info     => {
  #       :id         => '1001',
  #       :login      => 'test_login',
  #       :email      => 'test@prx.org',
  #       :first_name => 'first',
  #       :last_name  => 'last'
  #     }
  #   }

  #   FakeWeb.register_uri(:get, "http://development.prx.org:3001/me", :body=>user.to_json)
    
  #   FakeWeb.register_uri(:post, "http://development.prx.org:3001/api/v2/pieces", :body=>{}.to_json)

  # end

  # def test_me
  #   response = PRX::Model::User.me
  #   puts response.parsed.inspect
  # end

  # def test_piece_create_with_local_file
  #   p = PRX::Model::Piece.new(:title=>'test title',
  #                             :short_description=>'test short description',
  #                             :description=>'test description',
  #                             :account=>PRX::Model::Account.new(:id=>8),
  #                             :producers=>[PRX::Model::Producer.new(:name=>'Producer')])
                              
  #   p.add_audio(:label=>'test', :attach_file=>'/Users/akuklewicz/test.mp2', :content_type=>'audio/mpeg')
  #   puts p.inspect
  #   response = PRX::Client.piece_create(p)
  #   puts response.parsed.inspect
  # end

  # def test_piece_create_with_remote_url
  #   p = PRX::Model::Piece.new(:title=>'test title', :short_description=>'test short description', :description=>'test description', :account_id=>8)
  #   p.add_audio(:label=>'test', :attach_file=>'s3://andrew-s3.prx.org/public/audio_files/118091/Baronowski.mp2')
  #   puts p.inspect
  #   response = PRX::Client.piece_create(p)
  #   puts response.parsed.inspect
  # end

end
