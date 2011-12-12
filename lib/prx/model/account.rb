module PRX
  module Model
    class Account < PRX::Model::Base

      attr_accessor :role, :user, :name, :pieces

      def initialize(*args)
        super
        @pieces = []
      end

    end
  end
end
