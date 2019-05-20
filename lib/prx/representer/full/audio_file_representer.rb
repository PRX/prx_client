require 'roar/json'
require 'roar/hypermedia'

module PRX
  module Representer
    module Full
      module AudioFileRepresenter
        include Roar::JSON
        include Roar::Hypermedia

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
