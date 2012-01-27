require 'prx/representer/full/piece_representer'

module PRX
  module Model
    class Piece < PRX::Model::Base

      include PRX::Representer::Full::PieceRepresenter

      attr_accessor :id, :title, :short_description, :description, :account_id, :published_at, :created_at, :produced_on
      attr_accessor :episode_number, :length, :language, :related_website, :credits, :broadcast_history, :intro, :outro
      attr_accessor :allow_comments, :is_shareable, :point_level, :network_only
      attr_accessor :promos, :license, :audio_versions, :producers, :creator, :account, :series, :networks

      def initialize(*args)
        super
        self.audio_versions ||= []
        self.networks ||= []
      end

      def add_audio(audio={})
        if self.audio_versions.size < 1
          self.audio_versions << AudioVersion.new(:label=>'Piece Audio')
        end
        self.audio_versions[0].audio_files << AudioFile.new(audio)
      end

    end
  end
end
