require File.dirname(__FILE__) + '/helper'

require 'prx/client'
require 'prx/model'

class PRX::TestAccount < Test::Unit::TestCase

  def test_initialize
    a = PRX::Model::Account.new(:name=>'n', :id=>1, :type_name=>'Group')
    assert a.is_a?(PRX::Model::Account)
    assert_equal a.name, 'n'
    assert_equal a.id, 1
  end

  def test_to_hash
    a = PRX::Model::Account.new(:name=>'n', :id=>1)
    assert_equal a.to_hash, {"name"=>"n", "id"=>1}
  end

end
