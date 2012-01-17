require 'prx/representer/account_representer'

module PRX
  module Model
    class Account < PRX::Model::Base

      include PRX::Representer::AccountRepresenter
      
      def member_type
        'Account'
      end
      
      def member_type=(mt)
      end

    end
  end
end
