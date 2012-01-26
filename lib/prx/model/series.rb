require 'prx/representer/full/series_representer'

module PRX
  module Model
    class Series < PRX::Model::Base

      include PRX::Representer::Full::SeriesRepresenter

    end
  end
end
