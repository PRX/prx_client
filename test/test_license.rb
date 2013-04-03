require File.dirname(__FILE__) + '/helper'

require 'prx/client'
require 'prx/model'

class PRX::TestLicense < Test::Unit::TestCase

  def test_initialize
    x = PRX::Model::License.new(:id=>1,
                                :website_usage=>PRX::Model::License::WEBSITE_USAGE[0],
                                :allow_edit=>PRX::Model::License::ALLOW_EDIT[0],
                                :additional_terms=>'a')
    assert x.is_a?(PRX::Model::License)
    assert_equal x.website_usage, PRX::Model::License::WEBSITE_USAGE[0]
    assert_equal x.allow_edit, PRX::Model::License::ALLOW_EDIT[0]
    assert_equal x.additional_terms, 'a'
    assert_equal x.id, 1
  end

  def test_to_hash
    x = PRX::Model::License.new(:id=>1,
                                :website_usage=>PRX::Model::License::WEBSITE_USAGE[0],
                                :allow_edit=>PRX::Model::License::ALLOW_EDIT[0],
                                :additional_terms=>'a')
    assert_equal x.to_hash, {"additional_terms"=>"a",
                             "allow_edit"=>"only with permission",
                             "id"=>1,
                             "website_usage"=>"as a free MP3 download and stream"}
  end
  
end
