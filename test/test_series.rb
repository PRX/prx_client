require File.dirname(__FILE__) + '/helper'

# require 'prx/client'
# require 'prx/model'
require 'prx/model/series'

class PRX::TestSeries < Test::Unit::TestCase

  def test_initialize
    s = PRX::Model::Series.new(:title=>'t', :id=>1)
    assert s.is_a?(PRX::Model::Series)
    assert_equal s.title, 't'
    assert_equal s.id, 1
  end

  def test_to_hash
    s = PRX::Model::Series.new(:title=>'t', :id=>1)
    assert_equal s.to_hash, {"title"=>"t", "id"=>1}
  end
  
  def test_to_json
    s = PRX::Model::Series.new(:title=>'t', :id=>1)
  end

end
