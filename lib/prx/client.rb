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
        access_token.post(create_url('pieces'), :body=>piece.as_json)
      end
      
      # # uploading a file:
      # payload = { :profile_pic => Faraday::UploadIO.new('avatar.jpg', 'image/jpeg') }
      # 
      # # "Multipart" middleware detects files and encodes with "multipart/form-data":
      # conn.put '/profile', payload        


      def client_options; @client_options ||= {}; end
      def access_token_options; @access_token_options ||= {}; end

      protected

      def create_url(path)
        "/api/#{version}/#{path}"
      end

      def client
        options = client_options.clone
        options[:site] = site unless options.has_key?(:site)
        OAuth2::Client.new(key, secret, {:site=>site})  do |builder|
          builder.request  :multipart if options[:multipart]
          # builder.request  :url_encoded
          builder.request  :json
          builder.response :logger
          
          builder.adapter  :net_http
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