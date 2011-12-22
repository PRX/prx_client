require 'prx/representer/network_representer'

module PRX
  module Model
    class Network < PRX::Model::Base

      include PRX::Representer::AccountRepresenter

      # attr_accessor :name
      # attr_accessor :type
      # 
      # # relationships
      # attr_accessor :networks
      # 
      # def initialize(*args)
      #   super
      # end

    end
  end
end
