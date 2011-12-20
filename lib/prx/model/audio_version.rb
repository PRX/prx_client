module PRX
  module Model
    class AudioVersion < PRX::Model::Base

      attr_accessor :label, :audio_files

      def initialize(*args)
        super
        @audio_files ||= []
        @json_options = {:include=>['audio_files']}
      end

      def audio_files=(afs)
        @promos = Array(afs).collect{|af| AudioFile.new(af) unless af.is_a?(AudioFile)}
      end

    end
  end
end
