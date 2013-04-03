require 'roar/representer/json'
require 'prx/model/base'
require 'prx/representer/full/account_representer'

module PRX
  module Model
    class Account < PRX::Model::Base

	  include Roar::Representer::JSON
      include PRX::Representer::Full::AccountRepresenter

      attr_accessor :name, :path, :type_name

    end
  end
end
