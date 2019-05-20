require 'roar/json'
require 'roar/hypermedia'

module PRX
  module Representer
    module Full
      module AccountRepresenter
        include Roar::JSON
        include Roar::Hypermedia

        property :id
        property :name
        property :path
        property :type_name, :from=>:type
      end
    end
  end
end
