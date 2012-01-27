require 'prx/representer/full/account_representer'

module PRX
  module Model
    class Account < PRX::Model::Base

      include PRX::Representer::Full::AccountRepresenter

      attr_accessor :id, :name, :path, :type_name

    end
  end
end
