require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module PRX
  module Representer
    module Full
      module AccountRepresenter
        
        include Roar::Representer::Feature::Hypermedia
        include Roar::Representer::JSON

        property :id
        property :name
        property :path
        property :type_name, :from=>:type
        
      end
    end
  end
end
