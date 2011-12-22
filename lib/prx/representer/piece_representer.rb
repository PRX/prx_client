require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'
require 'prx/model'

module PRX
  module Representer
    module PieceRepresenter
      include Roar::Representer::JSON
      include Roar::Representer::Feature::Hypermedia

      property :id
      property :title
      property :short_description
      property :description
      property :account_id
      property :published_at
      property :created_at
      property :produced_on
      property :episode_number
      property :length

      property    :promos,
                  :class  => PRX::Model::AudioVersion,
                  :extend => PRX::Representer::AudioVersionRepresenter

      property    :account, :class => PRX::Model::Account, :extend => PRX::Representer::AccountRepresenter

      property    :series,
                  :class  => PRX::Model::Series,
                  :extend => PRX::Representer::SeriesRepresenter

      collection  :audio_versions,
                  :class  => PRX::Model::AudioVersion,
                  :extend => PRX::Representer::AudioVersionRepresenter

      collection  :networks,
                  :class  => PRX::Model::Network,
                  :extend => PRX::Representer::NetworkRepresenter
      
    end
  end
end
