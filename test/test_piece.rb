load './helper.rb'
require 'prx/client'
require 'prx/model'
require 'net/http'

class PRX::TestPiece < Test::Unit::TestCase
  
  def test_piece_create_with_local_file
    p = PRX::Model::Piece.new(:title=>'test title')
    p.add_audio(:label=>'test', :file=>'/Users/akuklewicz/test.mp2', :mime_type=>'audio/mpeg')
    af = p.audio_versions[0].audio_files[0]
    assert af.is_a?(PRX::Model::AudioFile)
    assert af.file.is_a?(Faraday::UploadIO)
  end

  def test_piece_create_with_remote_url
    p = PRX::Model::Piece.new(:title=>'test title')
    p.add_audio(:label=>'test', :file=>'s3://andrew-s3.prx.org/test/test_short_download.mp3')
    af = p.audio_versions[0].audio_files[0]
    assert af.is_a?(PRX::Model::AudioFile)
    assert af.file.is_a?(String)
  end

end
