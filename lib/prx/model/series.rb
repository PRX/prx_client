require 'prx/representer/full/series_representer'

module PRX
  module Model
    class Series < PRX::Model::Base

      include PRX::Representer::Full::SeriesRepresenter

      attr_accessor :id, :title

    end
  end
end
