require 'rubygems'
require 'test/unit'
require 'net/http'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'prx_client'
require 'prx/client'

class Test::Unit::TestCase
end

PRX::Client.key     = 'WlziaXf34NighkX24LjnE9JgpEmEQkP8nWkBmh9J'
PRX::Client.secret  = 'iuUWEb3AfS5DQiOVpqH1juAacQ0vr3aIhNGWfIW9'
PRX::Client.host    = "development.prx.org"
PRX::Client.port    = 3000
PRX::Client.version = 'v2'
PRX::Client.token   = 'iW7qgZSQq4ryQRks1G57X7B1appJLOWeF4yZz6jn'
