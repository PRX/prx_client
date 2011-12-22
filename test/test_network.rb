load './helper.rb'
require 'prx/client'
require 'prx/model'
require 'net/http'

class PRX::TestNetwork < Test::Unit::TestCase

  def test_initialize
    a = PRX::Model::Network.new(:name=>'n', :id=>1, :path=>'p')
    assert a.is_a?(PRX::Model::Network)
    assert_equal a.name, 'n'
    assert_equal a.id, 1
    assert_equal a.path, 'p'
  end

  def test_to_hash
    a = PRX::Model::Network.new(:name=>'n', :id=>1)
    assert_equal a.to_hash, {"name"=>"n", "id"=>1}
  end
  
end
