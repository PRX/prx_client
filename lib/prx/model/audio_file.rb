module PRX
  module Model
    class AudioFile < PRX::Model::Base

      attr_accessor :label, :file

      def initialize(*args)
        super
      end

    end
  end
end
