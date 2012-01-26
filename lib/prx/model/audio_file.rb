require 'prx/representer/full/audio_file_representer'

module PRX
  module Model
    class AudioFile < PRX::Model::Base

      include PRX::Representer::Full::AudioFileRepresenter
      
      def attach_file=(f)
        super
        prepare_file_upload if f
        self.attach_file
      end

      def prepare_file_upload
        if self.attach_file && self.attach_file.is_a?(String)
          uri = URI.parse(self.attach_file)
          if uri.scheme.blank? || (uri.scheme == 'file')
            self.attach_file = Faraday::UploadIO.new(uri.path, self.content_type)
          end
        end
      end

      def initialize(*args)
        self.content_type = 'audio/mpeg'
        super
        self
      end

    end
  end
end
