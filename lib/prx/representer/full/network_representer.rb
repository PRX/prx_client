require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'
require "prx/representer/min/network_representer"

module PRX
  module Representer
    module Full
      module NetworkRepresenter
        
        include Roar::Representer::JSON
        include Roar::Representer::Feature::Hypermedia
        include PRX::Representer::Min::NetworkRepresenter
        
      end
    end
  end
end
