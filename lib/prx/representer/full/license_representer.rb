require 'roar/json'
require 'roar/hypermedia'

module PRX
  module Representer
    module Full
      module LicenseRepresenter
        include Roar::JSON
        include Roar::Hypermedia

        property :id
        property :website_usage
        property :allow_edit
        property :additional_terms
      end
    end
  end
end
