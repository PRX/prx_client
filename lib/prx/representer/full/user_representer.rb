require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module PRX
  module Representer
    module Full
      module UserRepresenter
        
        include Roar::Representer::Feature::Hypermedia
        include Roar::Representer::JSON

        property :id
        property :login
        property :email
        property :first_name
        property :last_name
        
      end
    end
  end
end
