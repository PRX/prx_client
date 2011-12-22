require 'prx/representer/audio_file_representer'

module PRX
  module Model
    class AudioFile < PRX::Model::Base

      include PRX::Representer::AudioFileRepresenter
      
      def file=(f)
        super
        prepare_file_upload if f
        self.file
      end

      def prepare_file_upload
        if self.file.is_a?(String)
          uri = URI.parse(@file)
          if uri.scheme.blank? || (uri.scheme == 'file')
            self.file = Faraday::UploadIO.new(uri.path, self.content_type)
          end
        end
      end

      def initialize(*args)
        self.content_type = 'audio/mpeg'
        super
        self
      end

      # attr_accessor :label, :file, :content_type, :size, :status

      
      # 
      # def file=(f)
      #   @file = f
      #   check_upload_file
      # end
      # 
      # def content_type=(m)
      #   raise "content_type cannot be blank" if m.blank?
      #   @content_type = m
      # end
      # 
      # def check_upload_file
      #   if @file.is_a?(String)
      #     uri = URI.parse(@file)
      #     if uri.scheme.blank? || (uri.scheme == 'file')
      #       @file = Faraday::UploadIO.new(uri.path, self.content_type)
      #     end
      #   end
      #   @file
      # end


    end
  end
end
