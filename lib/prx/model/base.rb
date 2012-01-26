require 'roar/representer'
require 'roar/representer/json'

module PRX
  module Model
    class Base

      include Roar::Representer::JSON

      def initialize(*args)
        return unless args
        if args[0].is_a?(Hash)
          args[0].each{|k,v| self.send("#{k.to_s}=", v)}
        end
      end
      
    end
  end
end
