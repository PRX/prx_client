require 'prx/representer/full/user_representer'

module PRX
  module Model
    class User < PRX::Model::Base

      include PRX::Representer::Full::UserRepresenter

      attr_accessor :id, :login, :email, :first_name, :last_name

    end
  end
end
