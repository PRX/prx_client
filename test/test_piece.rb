load './helper.rb'
require 'prx/client'
require 'prx/model'
require 'net/http'

class PRX::TestPiece < Test::Unit::TestCase

  def test_initialize
    a = PRX::Model::Piece.new(:title=>'t', :id=>1)
    assert a.is_a?(PRX::Model::Piece)
    assert_equal a.title, 't'
    assert_equal a.id, 1
  end

  def test_initialize_with_account_json
    a = PRX::Model::Piece.from_json({:title=>'t', :id=>1, :account=>{:id=>2}}.to_json)
    assert a.account.is_a?(PRX::Model::Account)
  end

  def test_initialize_with_account_object
    a = PRX::Model::Piece.from_json({:title=>'t', :id=>1, :account=>PRX::Model::Account.new(:id=>2)})
    assert a.account.is_a?(PRX::Model::Account)
  end

  def test_piece_create_with_local_file
    p = PRX::Model::Piece.new(:title=>'test title')
    p.add_audio(:label=>'test', :attach_file=>'/Users/akuklewicz/test.mp2', :content_type=>'audio/mpeg')
    af = p.audio_versions[0].audio_files[0]
    assert af.is_a?(PRX::Model::AudioFile)
    assert af.attach_file.is_a?(Faraday::UploadIO)
  end

  def test_piece_create_with_remote_url
    p = PRX::Model::Piece.new(:title=>'test title')
    p.add_audio(:label=>'test', :attach_file=>'s3://andrew-s3.prx.org/test/test_short_download.mp3')
    af = p.audio_versions[0].audio_files[0]
    assert af.is_a?(PRX::Model::AudioFile)
    assert af.attach_file.is_a?(String)
  end

end
