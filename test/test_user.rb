require File.dirname(__FILE__) + '/helper'

require 'prx/client'
require 'prx/model'

class PRX::TestUser < Test::Unit::TestCase

  def test_initialize
    s = PRX::Model::User.new(:email=>'t', :id=>1)
    assert s.is_a?(PRX::Model::User)
    assert_equal s.email, 't'
    assert_equal s.id, 1
  end

  def test_to_hash
    s = PRX::Model::User.new(:email=>'t', :id=>1)
    assert_equal s.to_hash, {"email"=>"t", "id"=>1}
  end
  
end
