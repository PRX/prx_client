module PRX
  module Model
    class Piece < PRX::Model::Base

      attr_accessor :title, :account, :audio_versions, :promos, :image

      def initialize(*args)
        super
        @audio_versions = [] # list of audio_versions
        @promos = []  # list of audio_files
      end

    end
  end
end
