require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'
require "prx/representer/min/user_representer"

module PRX
  module Representer
    module Full
      module UserRepresenter
        
        include Roar::Representer::JSON
        include Roar::Representer::Feature::Hypermedia
        include PRX::Representer::Min::UserRepresenter
        
      end
    end
  end
end
