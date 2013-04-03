require 'prx/model/base'
require 'prx/representer/full/series_representer'

require 'roar/representer/json'

module PRX
  module Model
    class Series < PRX::Model::Base

      include Roar::Representer::JSON
      include PRX::Representer::Full::SeriesRepresenter

      attr_accessor :title, :subscribable

      def pieces(refresh=false)
      	@_pieces = nil if refresh
        opts = {:path=>"series/#{id}/pieces", :action=>:get}
      	@_pieces ||= request(opts)
      	@_pieces
      end

    end
  end
end
