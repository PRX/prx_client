require 'roar/representer/json'
require 'prx/model/base'
require 'prx/representer/full/producer_representer'

module PRX
  module Model
    class Producer < PRX::Model::Base

      include Roar::Representer::JSON
      include PRX::Representer::Full::ProducerRepresenter

      attr_accessor :name, :email, :user

    end
  end
end
