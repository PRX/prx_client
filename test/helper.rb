require 'rubygems'

require 'dotenv'
Dotenv.load

require 'test/unit'
require 'net/http'
require 'webmock/test_unit'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'prx_client'
require 'prx/client'

class Test::Unit::TestCase
end

PRX::Client.key     = ENV['PRX_KEY']
PRX::Client.secret  = ENV['PRX_SECRET']
PRX::Client.host    = ENV['PRX_HOST']    || 'www.prx.org'
PRX::Client.port    = ENV['PRX_PORT']    || 80
PRX::Client.version = ENV['PRX_VERSION'] || 'v2'
PRX::Client.token   = ENV['PRX_TOKEN']
