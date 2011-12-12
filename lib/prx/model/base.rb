module PRX
  module Model
    class Base
      
      attr_accessor :id
      
      def initialize(*args)
        return unless args
        if args[0].is_a?(Hash)
          args[0].each{|k,v| self.send("#{k.to_s}=".to_sym, v)}
        end
      end
      
      def as_json_with_class_name(options={})
        {self.class.name.demodulize.underscore.to_sym => as_json_without_class_name(options)}
      end      
      alias_method_chain :as_json, :class_name
      
      def to_request(options={})
        as_json(options)
      end
      
    end
  end
end
