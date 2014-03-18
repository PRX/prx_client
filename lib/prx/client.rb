require 'prx/model'
require 'prx/representer'
require 'faraday'
require 'faraday_middleware'

module PRX
  module Client
    
    class << self
      
      include PRX::Model
      
      attr_accessor :key, :secret, :scheme, :host, :port, :version, :token

      def request(opts={})
        # puts "PRX::Client::request - opts: #{opts.inspect}"
        path = opts.delete(:path) || ''
        action = opts.delete(:action) || :get
        opts = default_options.merge(opts)

        path = api_path(path) unless path.starts_with?('/')
        response = access_token.send(action, path, opts)
        # puts response.inspect
        response
      end

      protected
      
      def api_path(path)
        "/api/#{version}/#{path}"
      end
      
      def access_token
        OAuth2::AccessToken.new(client, token, {})
      end

      def client
        OAuth2::Client.new(key, secret, {:site=>site})  do |b|
          b.request :multipart
          b.request :url_encoded
          b.request :json

          # b.response :logger

          b.adapter  :excon
        end
      end

      def site
        "#{scheme || 'http'}://#{host}:#{port}"
      end
      
      def default_options
        {
          'Accept' => 'application/json',
          'Content-Type' => 'application/json'
        }
      end
      
    end
    
  end
end