require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module PRX
  module Representer
    module Full
      module AudioFileRepresenter
        include Roar::Representer::JSON
        include Roar::Representer::Feature::Hypermedia
      
        property :id
        property :label
        property :attach_file
        property :content_type
        property :size
        property :status
        property :length
      
      end
    end
  end
end
