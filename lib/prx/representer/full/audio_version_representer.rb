require 'roar/json'
require 'roar/hypermedia'
require 'prx/model/audio_file'
require 'prx/representer/full/audio_file_representer'

module PRX
  module Representer
    module Full
      module AudioVersionRepresenter
        include Roar::JSON
        include Roar::Hypermedia

        property :id
        property :label
        property :content_advisory
        property :timing_and_cues
        property :transcript
        property :news_hole_break
        property :floating_break
        property :bottom_of_hour_break
        property :twenty_forty_break

        collection  :audio_files,
                    :class  => PRX::Model::AudioFile,
                    :extend => PRX::Representer::Full::AudioFileRepresenter
      end
    end
  end
end
