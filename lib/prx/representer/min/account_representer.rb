require 'roar/json'

module PRX
  module Representer
    module Min
      module AccountRepresenter
        include Roar::JSON
        # include Roar::Hypermedia

        property :id
        property :name
        property :path
        property :type_name, :from=>:type
      end
    end
  end
end
