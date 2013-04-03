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

      def find_by_id(id)
        request(:path => "#{class_path_part}/#{id}")
      end

      def save
        opts = {
          :action => (id ? :put : :post),
          :path   => (id ? "#{class_path_part}/#{id}" : class_path_part),
          :body   => as_json
        }
        response = request(opts)
        self.from_json(response.response.body)
      end

      def class_path_part
        self.class.name.demodulize.underscore.pluralize
      end

      def request(opts)
        self.class.request(opts)
      end

      def self.request(opts)
        PRX::Client.request(opts)
      end

    end
  end
end
