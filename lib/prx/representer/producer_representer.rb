require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

require "prx/representer/user_representer"

module PRX
  module Representer
    module ProducerRepresenter
      include Roar::Representer::JSON
      include Roar::Representer::Feature::Hypermedia
      
      property :id
      property :name
      property :email
      
      property :user,
               :class  => PRX::Model::User,
               :extend => PRX::Representer::UserRepresenter
    end
  end
end
