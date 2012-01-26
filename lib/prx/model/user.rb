require 'prx/representer/full/user_representer'

module PRX
  module Model
    class User < PRX::Model::Base

      include PRX::Representer::Full::UserRepresenter

    end
  end
end
