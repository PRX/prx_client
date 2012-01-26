load './helper.rb'
require 'prx/client'
require 'prx/model'
require 'net/http'

class PRX::TestAudioFile < Test::Unit::TestCase

  def test_initialize
    af = PRX::Model::AudioFile.new(:id=>1, :label=>'l', :size=>3000, :length=>30, :status=>'new', :content_type=>'audio/wav' )
    assert af.is_a?(PRX::Model::AudioFile)
    assert af.as_json === {"label"=>"l", "size"=>3000, "content_type"=>"audio/wav", "id"=>1, "length"=>30, "status"=>"new"}
  end

  def test_default_content_type
    af = PRX::Model::AudioFile.new()
    assert_equal af.content_type, 'audio/mpeg'
  end

  def test_prepare_upload
    af = PRX::Model::AudioFile.new(:attach_file=>'/Users/akuklewicz/test.mp2')
    assert af.attach_file.is_a?(Faraday::UploadIO)
  end
  
end
