load './helper.rb'
require 'prx/client'
require 'prx/model'
require 'net/http'

class PRX::TestAudioVersion < Test::Unit::TestCase

  def test_initialize
    af = PRX::Model::AudioVersion.new(:label=>'l')
    assert af.is_a?(PRX::Model::AudioVersion)
    assert_equal({"label"=>"l", "audio_files"=>[]}.to_json, af.to_json)
  end

  def test_initialize_with_audio_files
    af = PRX::Model::AudioVersion.new(:label=>'l', :audio_files=>[PRX::Model::AudioFile.new(:label=>'af')])
    assert af.is_a?(PRX::Model::AudioVersion)
    assert_equal({"label"=>"l", "audio_files"=>[{"label"=>"af", "content_type"=>"audio/mpeg"}]}.to_json, af.to_json)
  end

  def test_initialize_with_json
    json = {"label"=>"l", "audio_files"=>[{"label"=>"af"}]}.to_json
    af = PRX::Model::AudioVersion.from_json(json)
    assert af.is_a?(PRX::Model::AudioVersion)
    assert af.audio_files.first.is_a?(PRX::Model::AudioFile)
  end
  
end
