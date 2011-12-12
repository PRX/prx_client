module PRX
  module Model
    class AudioVersion < PRX::Model::Base

      attr_accessor :label, :audio_file

      def initialize(*args)
        super
      end

    end
  end
end
