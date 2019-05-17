require 'roar/json'
require 'roar/hypermedia'

module PRX
  module Representer
    module Full
      module SeriesRepresenter
        include Roar::JSON
        include Roar::Hypermedia

        property :id
        property :title
      end
    end
  end
end
