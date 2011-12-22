require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module PRX
  module Representer
    module SeriesRepresenter
      include Roar::Representer::JSON
      include Roar::Representer::Feature::Hypermedia
 
      property :id
      property :title
      
    end
  end
end
