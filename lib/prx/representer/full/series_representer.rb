require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module PRX
  module Representer
    module Full
      module SeriesRepresenter
        
        include Roar::Representer::Feature::Hypermedia
        include Roar::Representer::JSON

        property :id
        property :title
        
      end
    end
  end
end
