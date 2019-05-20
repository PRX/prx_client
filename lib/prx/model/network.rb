require 'prx/model/base'
require 'prx/representer/full/network_representer'

module PRX
  module Model
    class Network < PRX::Model::Base

      include Roar::JSON
      include PRX::Representer::Full::NetworkRepresenter

      attr_accessor :name, :path

    end
  end
end
