require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'
require "prx/representer/min/account_representer"

module PRX
  module Representer
    module Full
      module AccountRepresenter
        
        include Roar::Representer::JSON
        include Roar::Representer::Feature::Hypermedia
        include PRX::Representer::Min::AccountRepresenter
        
      end
    end
  end
end
