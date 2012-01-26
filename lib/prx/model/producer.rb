require 'prx/representer/full/producer_representer'

module PRX
  module Model
    class Producer < PRX::Model::Base

      include PRX::Representer::Full::ProducerRepresenter

    end
  end
end
