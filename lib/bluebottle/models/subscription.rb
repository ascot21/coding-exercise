require 'active_support/all'

module BlueBottle
  module Models
    class Subscription
      attr_accessor :customer_id,
                    :coffee_id,
                    :status
                    
      VALID_STATUSES = ['active', 'paused']
      
      VALID_STATUSES.each do |status|
        define_method "#{status}?" do 
          self.status == status
        end
      end

      def initialize(customer_id, coffee_id, status='active')
        @customer_id = customer_id
        @coffee_id = coffee_id
        @status = status
        validate_status
      end
      
      def pause
        self.status = 'paused'
      end

      private
      
      def validate_status
        raise "'#{status}' is not a valid status of coffee. Valid status are #{VALID_STATUSES.join(', ')}." unless VALID_STATUSES.include?(status)
      end
      
    end
  end
end
