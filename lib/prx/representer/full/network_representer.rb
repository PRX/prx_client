require 'roar/json'
require 'roar/hypermedia'

module PRX
  module Representer
    module Full
      module NetworkRepresenter
        include Roar::JSON
        include Roar::Hypermedia

        property :id
        property :name
        property :path
      end
    end
  end
end
