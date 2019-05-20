require 'roar/json'
require 'roar/hypermedia'

require "prx/representer/min/user_representer"

module PRX
  module Representer
    module Full
      module ProducerRepresenter
        include Roar::JSON
        include Roar::Hypermedia

        property :id
        property :name
        property :email

        property :user,
                 :class  => PRX::Model::User,
                 :extend => PRX::Representer::Min::UserRepresenter
      end
    end
  end
end
