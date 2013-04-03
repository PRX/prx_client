require 'roar/representer/json'
require 'prx/model/base'
require 'prx/representer/full/user_representer'

module PRX
  module Model
    class User < PRX::Model::Base

      include Roar::Representer::JSON
      include PRX::Representer::Full::UserRepresenter

      attr_accessor :login, :email, :first_name, :last_name

      def self.me
      	request(:path=>'/me')
      end

    end
  end
end
