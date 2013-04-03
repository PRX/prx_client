require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module PRX
  module Representer
    module Full
      module AudioFileRepresenter

        include Roar::Representer::Feature::Hypermedia
        include Roar::Representer::JSON
      
        property :id
        property :label
        property :attach_file
        property :content_type
        property :size
        property :status
        property :length
        property :url, :if => lambda {|opts| opts[:link_audio]}      

      end
    end
  end
end
