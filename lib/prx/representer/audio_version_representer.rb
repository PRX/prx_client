require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'
require 'prx/model'

module PRX
  module Representer
    module AudioVersionRepresenter
      include Roar::Representer::JSON
      include Roar::Representer::Feature::Hypermedia
 
      property :id
      property :label
      
      collection  :audio_files,
                  :class  => PRX::Model::AudioFile,
                  :extend => PRX::Representer::AudioFileRepresenter
      
    end
  end
end
