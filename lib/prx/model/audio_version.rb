require 'prx/representer/audio_version_representer'

module PRX
  module Model
    class AudioVersion < PRX::Model::Base

      include PRX::Representer::AudioVersionRepresenter

      def initialize(*args)
        super
        self.audio_files ||= []
      end

      # attr_accessor :label
      # 
      # # relationships
      # attr_accessor :audio_files
      # 
      # def initialize(*args)
      #   super
      #   @audio_files ||= []
      #   @json_options = {:include=>['audio_files']}
      # end
      # 
      # def audio_files=(afs)
      #   @promos = Array(afs).collect{|af| AudioFile.new(af) unless af.is_a?(AudioFile)}
      # end
      # 
    end
  end
end
