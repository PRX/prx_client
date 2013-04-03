require File.dirname(__FILE__) + '/helper'

require 'prx/client'
require 'prx/model'

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
    a = PRX::Model::Piece.from_json({:title=>'t', :id=>1, :account=>PRX::Model::Account.new(:id=>2)}.to_json)
    assert a.account.is_a?(PRX::Model::Account)
  end

  def test_piece_with_local_file
    p = PRX::Model::Piece.new(:title=>'test title')
    p.add_audio(:label=>'test', :attach_file=>"#{File.dirname(__FILE__)}/files/test.mp2", :content_type=>'audio/mpeg')
    af = p.audio_versions[0].audio_files[0]
    assert af.is_a?(PRX::Model::AudioFile)
    assert af.attach_file.is_a?(Faraday::UploadIO)
  end

  def test_piece_with_remote_url
    p = PRX::Model::Piece.new(:title=>'test title')
    p.add_audio(:label=>'test', :attach_file=>'s3://andrew-s3.prx.org/test/test_short_download.mp3')
    af = p.audio_versions[0].audio_files[0]
    assert af.is_a?(PRX::Model::AudioFile)
    assert af.attach_file.is_a?(String)
  end

  # def test_piece_create_with_local_file
  #   p = PRX::Model::Piece.new(:title=>'test title')
  #   p.add_audio(:label=>'test', :attach_file=>"#{File.dirname(__FILE__)}/files/test.mp2", :content_type=>'audio/mpeg')
  #   p.save
  # end

  def test_piece_create
    prx_remix = { :account_id  => 98822,
                  :series_id   => 32346,
                  :network_id  => 23 }

    piece = PRX::Model::Piece.new(
      :title             => "Remix Select: Episode 12345",
      :episode_number    => 12345,
      :episode_identifier=> '12345',
      :short_description => "Episode 12345 of the new Public Radio Remix Select series. Based on Remix 24 episode 54321.",
      :description       => "this is the description, and it is very long",
      :account           => PRX::Model::Account.new(:id=>prx_remix[:account_id]),
      :series            => PRX::Model::Series.new(:id=>prx_remix[:series_id]),
      :producers         => [PRX::Model::Producer.new(:user=>PRX::Model::User.new(:id=>8))],
      :license           => PRX::Model::License.new(:website_usage=>'as a free MP3 download and stream', :allow_edit=>'only with permission'),
      :networks          => [PRX::Model::Network.new(:id=>prx_remix[:network_id])],
      :network_only      => true,
      :point_level       => 0,
      :publish_on_valid  => true
    )
    # piece.add_audio(:label=>'audio', :attach_file=>"s3://#{remix_bucket}/#{audio_s3_key}", :size=>1)
    # puts "\n\npiece before saved: #{piece.to_json}"
    piece.save
    assert piece.id && (piece.id > 0)
    # puts "\n\npiece after saved:  #{piece.to_json}"
  end

end
