module PRX
  module Model
    class User < PRX::Model::Base

      attr_accessor :login, :email, :first_name, :last_name

      def initialize(*args)
        super
      end

    end
  end
end
