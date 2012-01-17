require 'roar/representer'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

require "prx/representer/account_representer"
require "prx/representer/audio_version_representer"
require "prx/representer/network_representer"
require "prx/representer/series_representer"
require "prx/representer/user_representer"
require "prx/representer/producer_representer"

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
      property :language
      property :related_website
      property :credits
      property :broadcast_history
      property :intro
      property :outro
      property :allow_comments
      property :is_shareable
      property :point_level

      property    :creator,
                  :class  => PRX::Model::User,
                  :extend => PRX::Representer::UserRepresenter

      property    :account,
                  :class  => PRX::Model::Account,
                  :extend => PRX::Representer::AccountRepresenter

      property    :series,
                  :class  => PRX::Model::Series,
                  :extend => PRX::Representer::SeriesRepresenter

      property    :promos,
                  :class  => PRX::Model::AudioVersion,
                  :extend => PRX::Representer::AudioVersionRepresenter

      collection  :audio_versions,
                  :class  => PRX::Model::AudioVersion,
                  :extend => PRX::Representer::AudioVersionRepresenter

      collection  :networks,
                  :class  => PRX::Model::Network,
                  :extend => PRX::Representer::NetworkRepresenter

      collection  :producers,
                  :class  => PRX::Model::Producer,
                  :extend => PRX::Representer::ProducerRepresenter
      
    end
  end
end
