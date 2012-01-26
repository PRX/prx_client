require 'prx/representer/full/piece_representer'

module PRX
  module Model
    class Piece < PRX::Model::Base

      include PRX::Representer::Full::PieceRepresenter

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
