module PRX
  module Model
    class AudioFile < PRX::Model::Base

      attr_accessor :label, :file, :mime_type, :size

      def initialize(*args)
        @mime_type = 'audio/mpeg'
        super
        check_upload_file
        self
      end
      
      def file=(f)
        @file = f
        check_upload_file
      end
      
      def mime_type=(m)
        raise "mime_type cannot be blank" if m.blank?
        @mime_type = m
      end
      
      def check_upload_file
        if @file.is_a?(String)
          uri = URI.parse(@file)
          if uri.scheme.blank? || (uri.scheme == 'file')
            @file = Faraday::UploadIO.new(uri.path, self.mime_type)
          end
        end
        @file
      end

    end
  end
end
