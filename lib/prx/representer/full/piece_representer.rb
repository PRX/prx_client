require 'roar/json'
require 'roar/hypermedia'

require "prx/model/audio_version"
require "prx/model/license"
require "prx/model/producer"
require "prx/model/user"
require "prx/model/account"
require "prx/model/series"
require "prx/model/network"

require "prx/representer/min/account_representer"
require "prx/representer/min/network_representer"
require "prx/representer/min/series_representer"
require "prx/representer/min/user_representer"

require "prx/representer/full/audio_version_representer"
require "prx/representer/full/producer_representer"
require "prx/representer/full/license_representer"

module PRX
  module Representer
    module Full
      module PieceRepresenter
        include Roar::JSON
        include Roar::Hypermedia

        property :id
        property :title
        property :short_description
        property :description
        property :account_id
        property :published_at
        property :created_at
        property :produced_on
        property :episode_number
        property :episode_date
        property :episode_hour
        property :episode_identifier
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
        property :network_only
        property :publish_on_valid

        # child models we provide full
        property    :promos,
                    :class  => PRX::Model::AudioVersion,
                    :extend => PRX::Representer::Full::AudioVersionRepresenter

        property    :license,
                    :class  => PRX::Model::License,
                    :extend => PRX::Representer::Full::LicenseRepresenter

        collection  :audio_versions,
                    :class  => PRX::Model::AudioVersion,
                    :extend => PRX::Representer::Full::AudioVersionRepresenter

        collection  :producers,
                    :class  => PRX::Model::Producer,
                    :extend => PRX::Representer::Full::ProducerRepresenter

        # parent models we provide min
        property    :creator,
                    :class  => PRX::Model::User,
                    :extend => PRX::Representer::Min::UserRepresenter

        property    :account,
                    :class  => PRX::Model::Account,
                    :extend => PRX::Representer::Min::AccountRepresenter

        property    :series,
                    :class  => PRX::Model::Series,
                    :extend => PRX::Representer::Min::SeriesRepresenter

        collection  :networks,
                    :class  => PRX::Model::Network,
                    :extend => PRX::Representer::Min::NetworkRepresenter
      end
    end
  end
end
