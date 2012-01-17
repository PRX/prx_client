require 'prx/representer/producer_representer'

module PRX
  module Model
    class Producer < PRX::Model::Base

      include PRX::Representer::ProducerRepresenter

    end
  end
end
