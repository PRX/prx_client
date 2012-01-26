require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'
require "prx/representer/min/series_representer"

module PRX
  module Representer
    module Full
      module SeriesRepresenter
        
        include Roar::Representer::JSON
        include Roar::Representer::Feature::Hypermedia
        include PRX::Representer::Min::SeriesRepresenter
        
      end
    end
  end
end
