require 'helper'
require 'prx/client'
require 'prx/model'
require 'net/http'

class PRX::TestClient < Test::Unit::TestCase
  
  def setup 
    PRX::Client.key     = 'bZG3A36fAVa9UTD3TlUN2L17Q2loTAN3G9tyOfVF'
    PRX::Client.secret  = 'rGrSNofeaJCbfDjJtYMFAQSfUIQhtr1vkNnaZQvf'
    PRX::Client.host    = "development.prx.org"
    PRX::Client.port    = 3001
    PRX::Client.version = 'v2'
    PRX::Client.token   = 'Kq4FhSK3arQ7jZ9xhiVAbDKw30mvXv4C8sl2CzCV'
  end
  
  # def test_me
  #   response = PRX::Client.me
  #   puts response.parsed.inspect
  # end

  def test_piece_create
    p = PRX::Model::Piece.new(:title=>'test title')
    response = PRX::Client.piece_create(p)
    puts response.parsed.inspect
  end
  
  # def test_piece_create_net_http
  #   http = Net::HTTP.new(PRX::Client.host, PRX::Client.port)
  # 
  #   request = Net::HTTP::Post.new("/api/v2/pieces")
  #   request.set_form_data({"piece[title]" => "net_http"})
  #   response = http.request(request)
  #   puts response.inspect
  # end    
  
end
