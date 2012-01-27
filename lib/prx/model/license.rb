require 'prx/representer/full/license_representer'

module PRX
  module Model
    class License < PRX::Model::Base

      include PRX::Representer::Full::LicenseRepresenter

      attr_accessor :id, :website_usage, :allow_edit, :additional_terms

      WEBSITE_USAGE = ['as a free MP3 download and stream', 'as a stream only', 'only with permission']
      ALLOW_EDIT = ['only with permission', 'without further permission', 'never']

    end
  end
end
