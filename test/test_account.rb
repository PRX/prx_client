load './helper.rb'
require 'prx/client'
require 'prx/model'
require 'net/http'

class PRX::TestAccount < Test::Unit::TestCase

  def test_initialize
    a = PRX::Model::Account.new(:name=>'n', :id=>1)
    assert a.is_a?(PRX::Model::Account)
    assert_equal a.name, 'n'
    assert_equal a.id, 1
  end

  def test_to_hash
    a = PRX::Model::Account.new(:name=>'n', :id=>1)
    assert_equal a.to_hash, {"name"=>"n", "id"=>1}
  end
  
end
