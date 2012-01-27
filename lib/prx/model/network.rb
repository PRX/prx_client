require 'prx/representer/full/network_representer'

module PRX
  module Model
    class Network < PRX::Model::Base

      include PRX::Representer::Full::AccountRepresenter

      attr_accessor :id, :name, :path

    end
  end
end
