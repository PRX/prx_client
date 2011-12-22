require 'prx/client/version'
require 'prx/model'

module PRX
  module Client
    
    class << self
      
      include PRX::Model

      attr_accessor :key, :secret, :scheme, :host, :port, :version, :token, :client_options, :access_token_options
      
      # get information about the current user
      def me
        access_token.get('/me', default_options)
      end
      
      def piece_create(piece)
        client_options[:multipart] = true
        access_token.post(create_url('pieces'), :body=>{:piece=>piece.as_json}, 'Content-Type' => 'application/json')
        # access_token.post(create_url('pieces'), :body=>{:test=>{:nested=>piece.audio_versions[0].audio_files[0].file}})
        # access_token.post(create_url('pieces'), :body=>{:test=>[piece.audio_versions[0].audio_files[0].file]})
      end
      
      def client_options; @client_options ||= {}; end
      def access_token_options; @access_token_options ||= {}; end

      protected

      def create_url(path)
        "/api/#{version}/#{path}"
      end

      def client
        options = client_options.clone
        options[:site] = site unless options.has_key?(:site)
        OAuth2::Client.new(key, secret, {:site=>site})  do |b|

          b.request :multipart # if options[:multipart]
          b.request :url_encoded
          b.request :json

          # b.response :logger
          
          b.adapter  :net_http
        end
      end

      def access_token
        OAuth2::AccessToken.new(client, token, access_token_options.clone)
      end

      def site
        "#{scheme || 'http'}://#{host}:#{port}"
      end
      
      def default_options
        {'Accept' => 'application/json'}
      end
      
    end
    
  end
end