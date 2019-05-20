require 'roar/json'
require 'roar/hypermedia'

module PRX
  module Representer
    module Min
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
