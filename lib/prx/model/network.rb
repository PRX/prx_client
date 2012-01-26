require 'prx/representer/full/network_representer'

module PRX
  module Model
    class Network < PRX::Model::Base

      include PRX::Representer::Full::AccountRepresenter

    end
  end
end
