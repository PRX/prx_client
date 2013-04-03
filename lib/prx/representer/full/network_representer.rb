require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module PRX
  module Representer
    module Full
      module NetworkRepresenter
        
        include Roar::Representer::Feature::Hypermedia
        include Roar::Representer::JSON

        property :id
        property :name
        property :path
        
      end
    end
  end
end
