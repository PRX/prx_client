module PRX
  module Model
    class Base
      
      attr_accessor :id
      
      def initialize(*args)
        return unless args
        if args[0].is_a?(Hash)
          args[0].each{|k,v| self.send("#{k.to_s}=", v)}
        end
      end
      
      def as_json_with_class_name(options={})
        options = options.merge(@json_options) if @json_options
        hash = as_json_without_class_name(options)
        hash.delete('json_options')
        
        Array(options[:include]).each do |attribute|
          child_options = {:include_root=>false}
          value = self.send(attribute)
          hash[attribute.to_s] = value.is_a?(Enumerable) ? value.map {|r| r.as_json(child_options)} : value.as_json(child_options)
        end
        
        if options.has_key?(:include_root) && !options[:include_root]
          hash
        else
          {self.class.name.demodulize.underscore.to_sym => hash}
        end

      end      
      alias_method_chain :as_json, :class_name
      
      def to_request(options={})
        as_json(options)
      end
      
    end
  end
end
