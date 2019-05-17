require 'roar/json'
require 'roar/hypermedia'

module PRX
  module Representer
    module Full
      module UserRepresenter
        include Roar::JSON
        include Roar::Hypermedia

        property :id
        property :login
        property :email
        property :first_name
        property :last_name
      end
    end
  end
end
