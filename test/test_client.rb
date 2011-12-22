load './helper.rb'
require 'prx/client'
require 'prx/model'
require 'net/http'
require 'fakeweb'

class PRX::TestClient < Test::Unit::TestCase
  
  def setup 
    PRX::Client.key     = 'bZG3A36fAVa9UTD3TlUN2L17Q2loTAN3G9tyOfVF'
    PRX::Client.secret  = 'rGrSNofeaJCbfDjJtYMFAQSfUIQhtr1vkNnaZQvf'
    PRX::Client.host    = "development.prx.org"
    PRX::Client.port    = 3001
    PRX::Client.version = 'v2'
    PRX::Client.token   = 'Kq4FhSK3arQ7jZ9xhiVAbDKw30mvXv4C8sl2CzCV'

    user = {
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

    # FakeWeb.register_uri(:get, "http://development.prx.org:3001/me", :body=>user.to_json)
    # 
    # FakeWeb.register_uri(:post, "http://development.prx.org:3001/api/v2/pieces", :body=>{}.to_json)

  end

  # def test_me
  #   response = PRX::Client.me
  #   puts response.parsed.inspect
  # end

  def test_piece_create_with_local_file
    p = PRX::Model::Piece.new(:title=>'test title',
                              :short_description=>'test short description',
                              :description=>'test description',
                              :account=>PRX::Model::Account.new(:id=>8))
                              
    puts p.to_json.inspect
    p.add_audio(:label=>'test', :file=>'/Users/akuklewicz/test.mp2', :content_type=>'audio/mpeg')
    response = PRX::Client.piece_create(p)
    puts response.parsed.inspect
  end

  # def test_piece_create_with_remote_url
  #   p = PRX::Model::Piece.new(:title=>'test title', :short_description=>'test short description', :description=>'test description', :account_id=>8)
  #   p.add_audio(:label=>'test', :file=>'s3://andrew-s3.prx.org/public/audio_files/118091/Baronowski.mp2', :size=>1)
  #   response = PRX::Client.piece_create(p)
  #   puts response.parsed.inspect
  # end

end
