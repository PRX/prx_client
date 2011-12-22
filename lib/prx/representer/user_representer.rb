require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module PRX
  module Representer
    module UserRepresenter
      include Roar::Representer::JSON
      include Roar::Representer::Feature::Hypermedia
 
      property :id
      property :login
      property :email
      property :first_name
      property :last_name
      
    end
  end
end
