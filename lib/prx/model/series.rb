require 'prx/representer/series_representer'

module PRX
  module Model
    class Series < PRX::Model::Base

      include PRX::Representer::SeriesRepresenter

    end
  end
end
