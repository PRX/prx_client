require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module PRX
  module Representer
    module Full
      module LicenseRepresenter

        include Roar::Representer::Feature::Hypermedia
        include Roar::Representer::JSON

        property :id
        property :website_usage
        property :allow_edit
        property :additional_terms
      end
    end
  end
end
