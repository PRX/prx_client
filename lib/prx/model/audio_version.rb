require 'prx/representer/full/audio_version_representer'

module PRX
  module Model
    class AudioVersion < PRX::Model::Base

      include PRX::Representer::Full::AudioVersionRepresenter

      attr_accessor :id,:label,:content_advisory,:timing_and_cues,:transcript,:news_hole_break,:floating_break,:bottom_of_hour_break,:twenty_forty_break,:audio_files

      def initialize(*args)
        super
        self.audio_files ||= []
      end

    end
  end
end
