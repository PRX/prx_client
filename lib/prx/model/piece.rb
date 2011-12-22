require 'prx/representer/piece_representer'

module PRX
  module Model
    class Piece < PRX::Model::Base

      include PRX::Representer::PieceRepresenter

      def initialize(*args)
        super
        self.audio_versions ||= []
        self.networks ||= []
      end

      def add_audio(audio={})
        if self.audio_versions.size < 1
          self.audio_versions << AudioVersion.new(:label=>'Piece Audio')
        end
        self.audio_versions[0].audio_files << AudioFile.new(audio)
      end

      # attr_accessor :title
      # attr_accessor :short_description
      # attr_accessor :description
      # attr_accessor :published_at
      # attr_accessor :created_at
      # attr_accessor :produced_on
      # attr_accessor :episode_number
      # attr_accessor :length
      # 
      # # relationships
      # attr_accessor :audio_versions
      # attr_accessor :promos
      # attr_accessor :account
      # attr_accessor :series
      # 
      # def initialize(*args)
      #   super
      #   @promos ||= []
      #   @audio_versions ||= []
      #   @json_options = {:include=>['audio_versions', 'promos']}
      # end
      # 
      # def audio_versions=(avs)
      #   @audio_versions = Array(avs).collect{|av| AudioVersion.new(av) unless av.is_a?(AudioVersion)}
      # end
      # 
      # def promos=(ps)
      #   @promos = Array(ps).collect{|p| AudioFile.new(p) unless p.is_a?(AudioFile)}
      # end
      # 
      # # add an audio asset as a hash
      # def add_audio(audio={})
      #   if audio_versions.size < 1
      #     audio_versions << AudioVersion.new(:label=>'Piece Audio')
      #   end
      #   audio_versions[0].audio_files << AudioFile.new(audio)
      # end

    end
  end
end
