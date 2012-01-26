require 'prx/representer/full/audio_version_representer'

module PRX
  module Model
    class AudioVersion < PRX::Model::Base

      include PRX::Representer::Full::AudioVersionRepresenter

      def initialize(*args)
        super
        self.audio_files ||= []
      end

    end
  end
end
