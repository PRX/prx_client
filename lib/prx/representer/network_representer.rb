require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module PRX
  module Representer
    module NetworkRepresenter
      include Roar::Representer::JSON
      include Roar::Representer::Feature::Hypermedia
      
      property :id
      property :name
      property :path
      
    end
  end
end
